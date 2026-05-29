import Foundation

enum DeckMode: String, CaseIterable, Identifiable {
    case majorArcana
    case fullDeck

    var id: String { rawValue }

    var title: String {
        switch self {
        case .majorArcana:
            return "Major Arcana"
        case .fullDeck:
            return "Full Deck"
        }
    }

    var description: String {
        switch self {
        case .majorArcana:
            return "22 archetypal cards"
        case .fullDeck:
            return "All 78 tarot cards"
        }
    }
}

struct TarotCard: Identifiable, Hashable {
    let name: String
    let detail: String
    let assetName: String
    let isMajorArcana: Bool

    var id: String { assetName }
}

