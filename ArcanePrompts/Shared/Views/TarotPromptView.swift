import SwiftUI

struct TarotPromptView: View {
    enum InteractionStyle {
        case shake
        case button

        var helperText: String {
            switch self {
            case .shake:
                return "Shake your device to draw a new writing prompt."
            case .button:
                return "Draw a card to reveal a new writing prompt."
            }
        }
    }

    let interactionStyle: InteractionStyle

    @AppStorage("deckMode") private var deckModeRawValue = DeckMode.majorArcana.rawValue
    @State private var selectedCard: TarotCard?
    @State private var isShowingMenu = false
    @State private var showsSplash = true

    private var deckMode: DeckMode {
        get { DeckMode(rawValue: deckModeRawValue) ?? .majorArcana }
        nonmutating set { deckModeRawValue = newValue.rawValue }
    }

    private var currentAssetName: String {
        selectedCard?.assetName ?? TarotDeck.cardBackAssetName
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
        ZStack(alignment: .trailing) {
            CardArtworkView(assetName: currentAssetName, presentationMode: .immersive)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
                        isShowingMenu.toggle()
                    }
                }

            if isShowingMenu {
                ZStack(alignment: .trailing) {
                    Color.black.opacity(0.22)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
                                isShowingMenu = false
                            }
                        }

                    SettingsPanel(
                        deckMode: Binding(
                            get: { deckMode },
                            set: { deckMode = $0 }
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
                    .padding(.trailing, 12)
                    .padding(.vertical, 24)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                .ignoresSafeArea()
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

                CardArtworkView(assetName: currentAssetName)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(response: 0.34, dampingFraction: 0.82)) {
                            isShowingMenu.toggle()
                        }
                    }

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
}
