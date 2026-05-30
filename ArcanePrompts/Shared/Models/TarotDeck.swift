import Foundation

enum TarotDeck {
    static let majorArcana: [TarotCard] = [
        .init(name: "The Fool", detail: "Major Arcana", assetName: "00-TheFool", isMajorArcana: true),
        .init(name: "The Magician", detail: "Major Arcana", assetName: "01-TheMagician", isMajorArcana: true),
        .init(name: "The High Priestess", detail: "Major Arcana", assetName: "02-TheHighPriestess", isMajorArcana: true),
        .init(name: "The Empress", detail: "Major Arcana", assetName: "03-TheEmpress", isMajorArcana: true),
        .init(name: "The Emperor", detail: "Major Arcana", assetName: "04-TheEmperor", isMajorArcana: true),
        .init(name: "The Hierophant", detail: "Major Arcana", assetName: "05-TheHierophant", isMajorArcana: true),
        .init(name: "The Lovers", detail: "Major Arcana", assetName: "06-TheLovers", isMajorArcana: true),
        .init(name: "The Chariot", detail: "Major Arcana", assetName: "07-TheChariot", isMajorArcana: true),
        .init(name: "Strength", detail: "Major Arcana", assetName: "08-Strength", isMajorArcana: true),
        .init(name: "The Hermit", detail: "Major Arcana", assetName: "09-TheHermit", isMajorArcana: true),
        .init(name: "Wheel of Fortune", detail: "Major Arcana", assetName: "10-WheelOfFortune", isMajorArcana: true),
        .init(name: "Justice", detail: "Major Arcana", assetName: "11-Justice", isMajorArcana: true),
        .init(name: "The Hanged Man", detail: "Major Arcana", assetName: "12-TheHangedMan", isMajorArcana: true),
        .init(name: "Death", detail: "Major Arcana", assetName: "13-Death", isMajorArcana: true),
        .init(name: "Temperance", detail: "Major Arcana", assetName: "14-Temperance", isMajorArcana: true),
        .init(name: "The Devil", detail: "Major Arcana", assetName: "15-TheDevil", isMajorArcana: true),
        .init(name: "The Tower", detail: "Major Arcana", assetName: "16-TheTower", isMajorArcana: true),
        .init(name: "The Star", detail: "Major Arcana", assetName: "17-TheStar", isMajorArcana: true),
        .init(name: "The Moon", detail: "Major Arcana", assetName: "18-TheMoon", isMajorArcana: true),
        .init(name: "The Sun", detail: "Major Arcana", assetName: "19-TheSun", isMajorArcana: true),
        .init(name: "Judgement", detail: "Major Arcana", assetName: "20-Judgement", isMajorArcana: true),
        .init(name: "The World", detail: "Major Arcana", assetName: "21-TheWorld", isMajorArcana: true)
    ]

    static let fullDeck: [TarotCard] = majorArcana + minorArcana

    static func randomCard(for mode: DeckMode) -> TarotCard {
        let deck = cards(for: mode)
        return deck.randomElement() ?? majorArcana[0]
    }

    static func cards(for mode: DeckMode) -> [TarotCard] {
        switch mode {
        case .majorArcana:
            return majorArcana
        case .fullDeck:
            return fullDeck
        }
    }

    private static let minorArcana: [TarotCard] = {
        let suits = [
            ("Cups", "Cups"),
            ("Pentacles", "Pentacles"),
            ("Swords", "Swords"),
            ("Wands", "Wands")
        ]
        let ranks = [
            "Ace", "Two", "Three", "Four", "Five", "Six", "Seven",
            "Eight", "Nine", "Ten", "Page", "Knight", "Queen", "King"
        ]

        return suits.flatMap { suit in
            ranks.enumerated().map { index, rank in
                let assetName = "\(suit.0)\(String(format: "%02d", index + 1))"
                return TarotCard(
                    name: "\(rank) of \(suit.1)",
                    detail: "Minor Arcana",
                    assetName: assetName,
                    isMajorArcana: false
                )
            }
        }
    }()
}
