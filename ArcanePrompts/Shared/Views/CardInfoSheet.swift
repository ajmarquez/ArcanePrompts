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

    private var splitMeaning: (upright: String, reversed: String?)? {
        guard let meaning else { return nil }

        let parts = meaning.detail.components(separatedBy: "Reversed:")
        let upright = parts.first?.trimmingCharacters(in: .whitespacesAndNewlines) ?? meaning.detail
        let reversed = parts.count > 1 ? parts[1].trimmingCharacters(in: .whitespacesAndNewlines) : nil
        return (upright, reversed)
    }

    private var summaryText: String {
        guard let meaning else { return "Draw a card to load its meaning." }
        guard let splitMeaning else { return meaning.summary }

        if card.isReversed, let reversed = splitMeaning.reversed {
            return "Reversed: \(condensedSummary(from: reversed))"
        }

        return "Upright: \(condensedSummary(from: splitMeaning.upright))"
    }

    private var detailText: String {
        guard let meaning else { return "Draw a card to load its meaning." }
        return meaning.detail
    }

    private func condensedSummary(from text: String) -> String {
        let normalized = text
            .replacingOccurrences(of: "  ", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        let clauses = normalized
            .split(separator: ";")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        if clauses.count >= 2 {
            return clauses.prefix(2).joined(separator: "; ") + "."
        }

        let sentences = normalized
            .split(separator: ".")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        if let firstSentence = sentences.first {
            return firstSentence + "."
        }

        return normalized
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(card.displayName)
                            .font(.system(size: 26, weight: .semibold, design: .serif))
                            .foregroundStyle(AppTheme.sheetInk)

                        HStack(spacing: 8) {
                            Text(card.detail)
                                .font(.subheadline)
                                .foregroundStyle(AppTheme.sheetMuted)

                            Text(card.orientationLabel)
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(AppTheme.midnight)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(
                                    Capsule(style: .continuous)
                                        .fill(AppTheme.gold.opacity(0.9))
                                )
                        }
                    }

                    Spacer()

                    Button(action: onDismiss) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundStyle(AppTheme.sheetMuted)
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
                            Text(summaryText)
                        case .detail:
                            Text(detailText)
                        }
                    }
                    .font(.body)
                    .foregroundStyle(AppTheme.sheetInk)
                    .textSelection(.enabled)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Source")
                            .font(.footnote.weight(.semibold))
                            .foregroundStyle(AppTheme.sheetMuted)

                        Text(meaning.sourceTitle)
                            .font(.footnote)
                            .foregroundStyle(AppTheme.sheetMuted)

                        if let sourceURL = URL(string: meaning.sourceURL) {
                            Link("Open Sacred Texts source", destination: sourceURL)
                                .font(.footnote.weight(.semibold))
                                .foregroundStyle(AppTheme.sheetInk)
                        }
                    }
                    .padding(.top, 4)
                } else {
                    Text("Draw a card to load its meaning.")
                        .font(.body)
                        .foregroundStyle(AppTheme.sheetMuted)
                }
            }
            .padding(20)
        }
    }
}
