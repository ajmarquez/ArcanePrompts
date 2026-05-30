import SwiftUI

struct SettingsPanel: View {
    enum PresentationStyle {
        case floating
        case sheet
    }

    @Binding var deckMode: DeckMode
    @Binding var deckArtwork: TarotArtwork
    @Binding var cardBackDesign: CardBackDesign
    let onDismiss: () -> Void
    var presentationStyle: PresentationStyle = .floating

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Text("Settings")
                        .font(.system(size: 22, weight: .semibold, design: .serif))
                        .foregroundStyle(AppTheme.sheetInk)

                    Spacer()

                    Button(action: onDismiss) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundStyle(AppTheme.sheetMuted)
                    }
                    .buttonStyle(.plain)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Card Pool")
                        .font(.footnote.weight(.semibold))
                        .foregroundStyle(AppTheme.sheetMuted)

                    Picker("Card Pool", selection: $deckMode) {
                        ForEach(DeckMode.allCases) { mode in
                            Text(mode.title).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)

                    Text(deckMode.description)
                        .font(.footnote)
                        .foregroundStyle(AppTheme.sheetMuted)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Deck Artwork")
                        .font(.footnote.weight(.semibold))
                        .foregroundStyle(AppTheme.sheetMuted)

                    Picker("Deck Artwork", selection: $deckArtwork) {
                        ForEach(TarotArtwork.allCases) { artwork in
                            Text(artwork.title).tag(artwork)
                        }
                    }
                    .pickerStyle(.segmented)

                    Text(deckArtwork.description)
                        .font(.footnote)
                        .foregroundStyle(AppTheme.sheetMuted)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Card Back")
                        .font(.footnote.weight(.semibold))
                        .foregroundStyle(AppTheme.sheetMuted)

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
                                .foregroundStyle(AppTheme.sheetInk)

                            Picker("Card Back", selection: $cardBackDesign) {
                                ForEach(CardBackDesign.allCases) { design in
                                    Text("\(design.title) · \(design.subtitle)").tag(design)
                                }
                            }
                            .pickerStyle(.menu)

                            Text(cardBackDesign.description)
                                .font(.footnote)
                                .foregroundStyle(AppTheme.sheetMuted)
                        }
                    }
                }
            }
            .padding(20)
        }
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
                                .stroke(AppTheme.sheetMuted.opacity(0.18), lineWidth: 1)
                        )
                )
        case .sheet:
            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
