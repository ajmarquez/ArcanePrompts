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

enum CardBackDesign: String, CaseIterable, Identifiable {
    case mysticEye
    case mirroredTower
    case boschInferno

    static let defaultDesign: CardBackDesign = .mirroredTower

    var id: String { rawValue }

    var title: String {
        switch self {
        case .mysticEye:
            return "Alternative 1"
        case .mirroredTower:
            return "Alternative 2"
        case .boschInferno:
            return "Alternative 3"
        }
    }

    var subtitle: String {
        switch self {
        case .mysticEye:
            return "Mystic Eye"
        case .mirroredTower:
            return "Mirrored Tower"
        case .boschInferno:
            return "Bosch Inferno"
        }
    }

    var description: String {
        switch self {
        case .mysticEye:
            return "A clean occult eye with glyphwork and lunar corners."
        case .mirroredTower:
            return "The revised mirrored tower back with sun, moon, and compass wheel."
        case .boschInferno:
            return "A darker infernal back with creatures, towers, and a hellish sigil."
        }
    }

    var assetName: String {
        switch self {
        case .mysticEye:
            return "BackDesignMysticEye"
        case .mirroredTower:
            return "BackDesignMirroredTower"
        case .boschInferno:
            return "BackDesignBoschInferno"
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
