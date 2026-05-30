import SwiftUI

struct TarotPromptView: View {
    enum InteractionStyle {
        case shake
        case button

        var helperText: String {
            switch self {
            case .shake:
                return "Shake or double-tap to draw. Swipe left for tools. Swipe down to reset."
            case .button:
                return "Double-tap or press Draw to reveal a prompt. Swipe left for tools. Swipe down to reset."
            }
        }
    }

    enum ActiveSheet: String, Identifiable {
        case settings

        var id: String { rawValue }
    }

    let interactionStyle: InteractionStyle

    @AppStorage("deckMode") private var deckModeRawValue = DeckMode.majorArcana.rawValue
    @AppStorage("deckArtwork") private var deckArtworkRawValue = TarotArtwork.defaultArtwork.rawValue
    @AppStorage("cardBackDesign") private var cardBackDesignRawValue = CardBackDesign.defaultDesign.rawValue
    @State private var selectedCard: TarotCard?
    @State private var activeSheet: ActiveSheet?
    @State private var isShowingInfoModal = false
    @State private var isShowingMenu = false
    @State private var isShowingToolbar = false
    @State private var showsSplash = true

    private var deckMode: DeckMode {
        get { DeckMode(rawValue: deckModeRawValue) ?? .majorArcana }
        nonmutating set { deckModeRawValue = newValue.rawValue }
    }

    private var deckArtwork: TarotArtwork {
        get { TarotArtwork(rawValue: deckArtworkRawValue) ?? .defaultArtwork }
        nonmutating set { deckArtworkRawValue = newValue.rawValue }
    }

    private var cardBackDesign: CardBackDesign {
        get { CardBackDesign(rawValue: cardBackDesignRawValue) ?? .defaultDesign }
        nonmutating set { cardBackDesignRawValue = newValue.rawValue }
    }

    private var currentAssetName: String {
        selectedCard?.assetName ?? cardBackDesign.assetName
    }

    private var deckModeBinding: Binding<DeckMode> {
        Binding(
            get: { deckMode },
            set: { deckMode = $0 }
        )
    }

    private var deckArtworkBinding: Binding<TarotArtwork> {
        Binding(
            get: { deckArtwork },
            set: { newArtwork in
                updateDeckArtwork(newArtwork)
            }
        )
    }

    private var cardBackDesignBinding: Binding<CardBackDesign> {
        Binding(
            get: { cardBackDesign },
            set: { cardBackDesign = $0 }
        )
    }

    var body: some View {
        ZStack {
            if showsSplash {
                SplashView()
                    .transition(.opacity)
            } else {
                readingView
                    .transition(.opacity)
            }
        }
        .task {
            guard showsSplash else { return }
            try? await Task.sleep(for: .seconds(1.6))
            withAnimation(.easeOut(duration: 0.45)) {
                showsSplash = false
            }
        }
        .sheet(item: $activeSheet) { sheet in
            sheetView(for: sheet)
        }
        .fullScreenCover(isPresented: $isShowingInfoModal) {
            if let selectedCard {
                CardInfoModal(
                    card: selectedCard,
                    onDismiss: {
                        isShowingInfoModal = false
                    }
                )
            }
        }
    }

    @ViewBuilder
    private var readingView: some View {
        #if os(iOS)
        iosReadingView
        #else
        macReadingView
        #endif
    }

    #if os(iOS)
    private var iosReadingView: some View {
        ZStack {
            CardArtworkView(
                assetName: currentAssetName,
                isReversed: selectedCard?.isReversed ?? false,
                presentationMode: .immersive
            )
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    hideToolbar()
                }
                .onTapGesture(count: 2, perform: drawCard)
                .simultaneousGesture(cardSwipeGesture)

            if isShowingToolbar {
                HStack {
                    Spacer()

                    CardActionToolbar(
                        hasSelectedCard: selectedCard != nil,
                        onSettings: { presentSheet(.settings) },
                        onInfo: presentInfoModal
                    )
                    .padding(.trailing, 18)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
        }
        .onDeviceShake {
            guard interactionStyle == .shake else { return }
            drawCard()
        }
    }
    #endif

    private var macReadingView: some View {
        ZStack {
            LinearGradient(
                colors: [AppTheme.midnight, AppTheme.nightBlue, AppTheme.dusk],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer(minLength: 12)

                CardArtworkView(
                    assetName: currentAssetName,
                    isReversed: selectedCard?.isReversed ?? false
                )
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .contentShape(Rectangle())
                    .onTapGesture(count: 2, perform: drawCard)
                    .onTapGesture(perform: toggleMenu)
                    .simultaneousGesture(cardSwipeGesture)

                VStack(spacing: 8) {
                    Text(selectedCard?.displayName ?? "Arcane Prompts")
                        .font(.system(size: 24, weight: .semibold, design: .serif))
                        .foregroundStyle(AppTheme.parchment)
                        .multilineTextAlignment(.center)

                    Text(interactionStyle.helperText)
                        .font(.subheadline)
                        .foregroundStyle(AppTheme.parchment.opacity(0.72))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 24)

                if interactionStyle == .button {
                    Button(action: drawCard) {
                        Text("Draw a Card")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(AppTheme.gold)
                    .foregroundStyle(AppTheme.midnight)
                    .padding(.horizontal, 24)
                }

                Spacer(minLength: 20)
            }

            if isShowingMenu {
                HStack {
                    Spacer()

                    SettingsPanel(
                        deckMode: deckModeBinding,
                        deckArtwork: deckArtworkBinding,
                        cardBackDesign: cardBackDesignBinding,
                        onDismiss: {
                            withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
                                isShowingMenu = false
                            }
                        }
                    )
                    .padding(.trailing, 16)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                .padding(.vertical, 24)
            }
        }
    }

    @ViewBuilder
    private func sheetView(for sheet: ActiveSheet) -> some View {
        switch sheet {
        case .settings:
            SettingsPanel(
                deckMode: deckModeBinding,
                deckArtwork: deckArtworkBinding,
                cardBackDesign: cardBackDesignBinding,
                onDismiss: {
                    activeSheet = nil
                },
                presentationStyle: .sheet
            )
            .presentationDetents([.height(360), .medium])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(28)
        }
    }

    private func drawCard() {
        selectedCard = TarotDeck.randomCard(for: deckMode, artwork: deckArtwork)

        withAnimation(.spring(response: 0.36, dampingFraction: 0.8)) {
            isShowingMenu = false
            isShowingToolbar = false
        }
    }

    private func toggleMenu() {
        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
            isShowingMenu.toggle()
        }
    }

    private func resetToCardBack() {
        selectedCard = nil

        withAnimation(.spring(response: 0.36, dampingFraction: 0.84)) {
            isShowingMenu = false
            isShowingToolbar = false
        }
    }

    private func updateDeckArtwork(_ artwork: TarotArtwork) {
        deckArtwork = artwork

        guard let selectedCard else { return }

        self.selectedCard = TarotDeck.card(
            withID: selectedCard.cardID,
            artwork: artwork,
            isReversed: selectedCard.isReversed
        )
    }

    private func presentSheet(_ sheet: ActiveSheet) {
        hideToolbar()
        activeSheet = sheet
    }

    private func presentInfoModal() {
        guard selectedCard != nil else { return }
        hideToolbar()
        isShowingInfoModal = true
    }

    private func showToolbar() {
        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
            isShowingToolbar = true
        }
    }

    private func hideToolbar() {
        withAnimation(.spring(response: 0.28, dampingFraction: 0.88)) {
            isShowingToolbar = false
        }
    }

    private var cardSwipeGesture: some Gesture {
        DragGesture(minimumDistance: 24)
            .onEnded { value in
                if abs(value.translation.width) > abs(value.translation.height) {
                    if value.translation.width < -70 {
                        #if os(iOS)
                        showToolbar()
                        #else
                        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
                            isShowingMenu = true
                        }
                        #endif
                    } else if value.translation.width > 70 {
                        hideToolbar()
                        #if !os(iOS)
                        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
                            isShowingMenu = false
                        }
                        #endif
                    }
                    return
                }

                if value.translation.height > 90 {
                    resetToCardBack()
                } else if value.translation.height < -90 {
                    hideToolbar()
                    #if !os(iOS)
                    withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
                        isShowingMenu = false
                    }
                    #endif
                }
            }
    }
}
