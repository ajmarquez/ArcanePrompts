import SwiftUI

struct TarotPromptView: View {
    enum InteractionStyle {
        case shake
        case button

        var helperText: String {
            switch self {
            case .shake:
                return "Shake or double-tap to draw. Swipe up for options. Swipe down to reset."
            case .button:
                return "Double-tap or press Draw to reveal a prompt. Swipe up for options. Swipe down to reset."
            }
        }
    }

    let interactionStyle: InteractionStyle

    @AppStorage("deckMode") private var deckModeRawValue = DeckMode.majorArcana.rawValue
    @AppStorage("cardBackDesign") private var cardBackDesignRawValue = CardBackDesign.defaultDesign.rawValue
    @State private var selectedCard: TarotCard?
    @State private var isShowingMenu = false
    @State private var showsSplash = true

    private var deckMode: DeckMode {
        get { DeckMode(rawValue: deckModeRawValue) ?? .majorArcana }
        nonmutating set { deckModeRawValue = newValue.rawValue }
    }

    private var cardBackDesign: CardBackDesign {
        get { CardBackDesign(rawValue: cardBackDesignRawValue) ?? .defaultDesign }
        nonmutating set { cardBackDesignRawValue = newValue.rawValue }
    }

    private var currentAssetName: String {
        selectedCard?.assetName ?? cardBackDesign.assetName
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
            CardArtworkView(assetName: currentAssetName, presentationMode: .immersive)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture(count: 2, perform: drawCard)
                .simultaneousGesture(verticalSwipeGesture)
        }
        .onDeviceShake {
            guard interactionStyle == .shake else { return }
            drawCard()
        }
        .sheet(isPresented: $isShowingMenu) {
            SettingsPanel(
                deckMode: Binding(
                    get: { deckMode },
                    set: { deckMode = $0 }
                ),
                cardBackDesign: Binding(
                    get: { cardBackDesign },
                    set: { cardBackDesign = $0 }
                ),
                selectedCard: selectedCard,
                interactionLabel: interactionStyle.helperText,
                onReset: {
                    resetToCardBack()
                },
                onDismiss: {
                    isShowingMenu = false
                },
                presentationStyle: .sheet
            )
            .presentationDetents([.height(320), .medium])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(28)
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

                CardArtworkView(assetName: currentAssetName)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .contentShape(Rectangle())
                    .onTapGesture(count: 2, perform: drawCard)
                    .onTapGesture(perform: toggleMenu)
                    .simultaneousGesture(verticalSwipeGesture)

                VStack(spacing: 8) {
                    Text(selectedCard?.name ?? "Arcane Prompts")
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
                        deckMode: Binding(
                            get: { deckMode },
                            set: { deckMode = $0 }
                        ),
                        cardBackDesign: Binding(
                            get: { cardBackDesign },
                            set: { cardBackDesign = $0 }
                        ),
                        selectedCard: selectedCard,
                        interactionLabel: interactionStyle.helperText,
                        onReset: {
                            selectedCard = nil
                            isShowingMenu = false
                        },
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

    private func drawCard() {
        withAnimation(.spring(response: 0.36, dampingFraction: 0.8)) {
            selectedCard = TarotDeck.randomCard(for: deckMode)
            isShowingMenu = false
        }
    }

    private func toggleMenu() {
        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
            isShowingMenu.toggle()
        }
    }

    private func resetToCardBack() {
        withAnimation(.spring(response: 0.36, dampingFraction: 0.84)) {
            selectedCard = nil
            isShowingMenu = false
        }
    }

    private var verticalSwipeGesture: some Gesture {
        DragGesture(minimumDistance: 24)
            .onEnded { value in
                guard abs(value.translation.height) > abs(value.translation.width) else { return }

                if value.translation.height > 90 {
                    resetToCardBack()
                } else if value.translation.height < -90 {
                    isShowingMenu = true
                }
            }
    }
}
