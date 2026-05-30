import Foundation

enum TarotDeck {
    private struct MajorCardDefinition {
        let cardID: String
        let name: String
        let marseilleSourceID: String
    }

    private static let majorDefinitions: [MajorCardDefinition] = [
        .init(cardID: "00-TheFool", name: "The Fool", marseilleSourceID: "a22"),
        .init(cardID: "01-TheMagician", name: "The Magician", marseilleSourceID: "a01"),
        .init(cardID: "02-TheHighPriestess", name: "The High Priestess", marseilleSourceID: "a02"),
        .init(cardID: "03-TheEmpress", name: "The Empress", marseilleSourceID: "a03"),
        .init(cardID: "04-TheEmperor", name: "The Emperor", marseilleSourceID: "a04"),
        .init(cardID: "05-TheHierophant", name: "The Hierophant", marseilleSourceID: "a05"),
        .init(cardID: "06-TheLovers", name: "The Lovers", marseilleSourceID: "a06"),
        .init(cardID: "07-TheChariot", name: "The Chariot", marseilleSourceID: "a07"),
        .init(cardID: "08-Strength", name: "Strength", marseilleSourceID: "a11"),
        .init(cardID: "09-TheHermit", name: "The Hermit", marseilleSourceID: "a09"),
        .init(cardID: "10-WheelOfFortune", name: "Wheel of Fortune", marseilleSourceID: "a10"),
        .init(cardID: "11-Justice", name: "Justice", marseilleSourceID: "a08"),
        .init(cardID: "12-TheHangedMan", name: "The Hanged Man", marseilleSourceID: "a12"),
        .init(cardID: "13-Death", name: "Death", marseilleSourceID: "a13"),
        .init(cardID: "14-Temperance", name: "Temperance", marseilleSourceID: "a14"),
        .init(cardID: "15-TheDevil", name: "The Devil", marseilleSourceID: "a15"),
        .init(cardID: "16-TheTower", name: "The Tower", marseilleSourceID: "a16"),
        .init(cardID: "17-TheStar", name: "The Star", marseilleSourceID: "a17"),
        .init(cardID: "18-TheMoon", name: "The Moon", marseilleSourceID: "a18"),
        .init(cardID: "19-TheSun", name: "The Sun", marseilleSourceID: "a19"),
        .init(cardID: "20-Judgement", name: "Judgement", marseilleSourceID: "a20"),
        .init(cardID: "21-TheWorld", name: "The World", marseilleSourceID: "a21")
    ]

    private static let suitDefinitions = [
        ("Cups", "Cups"),
        ("Pentacles", "Pentacles"),
        ("Swords", "Swords"),
        ("Wands", "Wands")
    ]

    private static let ranks = [
        "Ace", "Two", "Three", "Four", "Five", "Six", "Seven",
        "Eight", "Nine", "Ten", "Page", "Knight", "Queen", "King"
    ]

    static func randomCard(for mode: DeckMode, artwork: TarotArtwork) -> TarotCard {
        let deck = cards(for: mode, artwork: artwork)
        return deck.randomElement() ?? majorArcana(for: artwork)[0]
    }

    static func cards(for mode: DeckMode, artwork: TarotArtwork) -> [TarotCard] {
        switch mode {
        case .majorArcana:
            return majorArcana(for: artwork)
        case .fullDeck:
            return fullDeck(for: artwork)
        }
    }

    static func card(withID cardID: String, artwork: TarotArtwork) -> TarotCard? {
        fullDeck(for: artwork).first(where: { $0.cardID == cardID })
    }

    static func majorArcana(for artwork: TarotArtwork) -> [TarotCard] {
        majorDefinitions.map { definition in
            TarotCard(
                cardID: definition.cardID,
                name: definition.name,
                detail: majorDetail(for: artwork),
                assetName: assetName(for: definition.cardID, artwork: artwork),
                isMajorArcana: true
            )
        }
    }

    static func fullDeck(for artwork: TarotArtwork) -> [TarotCard] {
        majorArcana(for: artwork) + minorArcana(for: artwork)
    }

    private static func minorArcana(for artwork: TarotArtwork) -> [TarotCard] {
        suitDefinitions.flatMap { suit in
            ranks.enumerated().map { index, rank in
                let cardID = "\(suit.0)\(String(format: "%02d", index + 1))"
                return TarotCard(
                    cardID: cardID,
                    name: "\(rank) of \(suit.1)",
                    detail: minorDetail(for: artwork),
                    assetName: assetName(for: cardID, artwork: artwork),
                    isMajorArcana: false
                )
            }
        }
    }

    private static func assetName(for cardID: String, artwork: TarotArtwork) -> String {
        artwork.assetPrefix + cardID
    }

    private static func majorDetail(for artwork: TarotArtwork) -> String {
        switch artwork {
        case .riderWaiteSmith:
            return "Major Arcana"
        case .marseille:
            return "Major Arcana · Marseille"
        }
    }

    private static func minorDetail(for artwork: TarotArtwork) -> String {
        switch artwork {
        case .riderWaiteSmith:
            return "Minor Arcana"
        case .marseille:
            return "Minor Arcana · Marseille"
        }
    }
}
