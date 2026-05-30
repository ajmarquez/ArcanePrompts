import SwiftUI

struct CardInfoSheet: View {
    enum Section: String, CaseIterable, Identifiable {
        case summary
        case detail

        var id: String { rawValue }

        var title: String {
            switch self {
            case .summary:
                return "Summary"
            case .detail:
                return "Detail"
            }
        }
    }

    let card: TarotCard
    let onDismiss: () -> Void

    @State private var section: Section = .summary

    private var meaning: TarotCardMeaning? {
        TarotMeaningCatalog.meaning(for: card.cardID)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(card.name)
                            .font(.system(size: 26, weight: .semibold, design: .serif))
                            .foregroundStyle(AppTheme.parchment)

                        Text(card.detail)
                            .font(.subheadline)
                            .foregroundStyle(AppTheme.parchment.opacity(0.72))
                    }

                    Spacer()

                    Button(action: onDismiss) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundStyle(AppTheme.parchment.opacity(0.8))
                    }
                    .buttonStyle(.plain)
                }

                Picker("Meaning", selection: $section) {
                    ForEach(Section.allCases) { item in
                        Text(item.title).tag(item)
                    }
                }
                .pickerStyle(.segmented)

                if let meaning {
                    Group {
                        switch section {
                        case .summary:
                            Text(meaning.summary)
                        case .detail:
                            Text(meaning.detail)
                        }
                    }
                    .font(.body)
                    .foregroundStyle(AppTheme.parchment)
                    .textSelection(.enabled)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Source")
                            .font(.footnote.weight(.semibold))
                            .foregroundStyle(AppTheme.gold)

                        Text(meaning.sourceTitle)
                            .font(.footnote)
                            .foregroundStyle(AppTheme.parchment.opacity(0.78))

                        if let sourceURL = URL(string: meaning.sourceURL) {
                            Link("Open Sacred Texts source", destination: sourceURL)
                                .font(.footnote.weight(.semibold))
                                .foregroundStyle(AppTheme.gold)
                        }
                    }
                    .padding(.top, 4)
                } else {
                    Text("Draw a card to load its meaning.")
                        .font(.body)
                        .foregroundStyle(AppTheme.parchment.opacity(0.72))
                }
            }
            .padding(20)
        }
    }
}
