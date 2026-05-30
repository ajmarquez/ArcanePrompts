import SwiftUI

struct SettingsPanel: View {
    enum PresentationStyle {
        case floating
        case sheet
    }

    @Binding var deckMode: DeckMode
    @Binding var cardBackDesign: CardBackDesign
    let selectedCard: TarotCard?
    let interactionLabel: String
    let onReset: () -> Void
    let onDismiss: () -> Void
    var presentationStyle: PresentationStyle = .floating

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("Arcane Prompts")
                    .font(.system(size: 22, weight: .semibold, design: .serif))
                    .foregroundStyle(AppTheme.parchment)

                Spacer()

                Button(action: onDismiss) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title3)
                        .foregroundStyle(AppTheme.parchment.opacity(0.8))
                }
                .buttonStyle(.plain)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Deck")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(AppTheme.gold)

                Picker("Deck", selection: $deckMode) {
                    ForEach(DeckMode.allCases) { mode in
                        Text(mode.title).tag(mode)
                    }
                }
                .pickerStyle(.segmented)

                Text(deckMode.description)
                    .font(.footnote)
                    .foregroundStyle(AppTheme.parchment.opacity(0.72))
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Card Back")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(AppTheme.gold)

                HStack(spacing: 14) {
                    Image(cardBackDesign.assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 66, height: 116)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(AppTheme.gold.opacity(0.28), lineWidth: 1)
                        )

                    VStack(alignment: .leading, spacing: 6) {
                        Text(cardBackDesign.subtitle)
                            .font(.headline)
                            .foregroundStyle(AppTheme.parchment)

                        Picker("Card Back", selection: $cardBackDesign) {
                            ForEach(CardBackDesign.allCases) { design in
                                Text("\(design.title) · \(design.subtitle)").tag(design)
                            }
                        }
                        .pickerStyle(.menu)

                        Text(cardBackDesign.description)
                            .font(.footnote)
                            .foregroundStyle(AppTheme.parchment.opacity(0.72))
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Current Card")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(AppTheme.gold)

                Text(selectedCard?.name ?? "Card Back")
                    .font(.headline)
                    .foregroundStyle(AppTheme.parchment)

                Text(selectedCard?.detail ?? "Using \(cardBackDesign.subtitle) until the next draw.")
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.parchment.opacity(0.72))
            }

            Text(interactionLabel)
                .font(.footnote)
                .foregroundStyle(AppTheme.parchment.opacity(0.72))

            Button("Return to Card Back", action: onReset)
                .buttonStyle(.borderedProminent)
                .tint(AppTheme.gold)
                .foregroundStyle(AppTheme.midnight)

            Spacer(minLength: 0)
        }
        .padding(20)
        .modifier(SettingsPanelContainerModifier(style: presentationStyle))
    }
}

private struct SettingsPanelContainerModifier: ViewModifier {
    let style: SettingsPanel.PresentationStyle

    func body(content: Content) -> some View {
        switch style {
        case .floating:
            content
                .frame(width: 280)
                .background(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .fill(.ultraThinMaterial.opacity(0.95))
                        .overlay(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .stroke(AppTheme.parchment.opacity(0.18), lineWidth: 1)
                        )
                )
        case .sheet:
            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
