import Foundation

struct TarotCardMeaning: Sendable, Hashable {
    let summary: String
    let detail: String
    let sourceTitle: String
    let sourceURL: String
}

enum TarotMeaningCatalog {
    static func meaning(for cardID: String) -> TarotCardMeaning? {
        meanings[cardID]
    }

    private static let meanings: [String: TarotCardMeaning] = [
        "00-TheFool": TarotCardMeaning(
            summary: "Upright: Folly, mania, extravagance, intoxication, delirium, frenzy, bewrayment. Reversed: Negligence, absence, distribution, carelessness, apathy, nullity, vanity.",
            detail: "Folly, mania, extravagance, intoxication, delirium, frenzy, bewrayment. Reversed: Negligence, absence, distribution, carelessness, apathy, nullity, vanity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "01-TheMagician": TarotCardMeaning(
            summary: "Upright: Skill, diplomacy, address, subtlety; sickness, pain, loss, disaster, snares of enemies; self-confidence, will; the Querent, if male. Reversed: Physician, Magus, mental disease, disgrace, disquiet.",
            detail: "Skill, diplomacy, address, subtlety; sickness, pain, loss, disaster, snares of enemies; self-confidence, will; the Querent, if male. Reversed: Physician, Magus, mental disease, disgrace, disquiet.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "02-TheHighPriestess": TarotCardMeaning(
            summary: "Upright: Secrets, mystery, the future as yet unrevealed; the woman who interests the Querent, if male; the Querent herself, if female; silence, tenacity; mystery, wisdom, science. Reversed: Passion, moral or physical ardour, conceit, surface knowledge.",
            detail: "Secrets, mystery, the future as yet unrevealed; the woman who interests the Querent, if male; the Querent herself, if female; silence, tenacity; mystery, wisdom, science. Reversed: Passion, moral or physical ardour, conceit, surface knowledge.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "03-TheEmpress": TarotCardMeaning(
            summary: "Upright: Fruitfulness, action, initiative, length of days; the unknown, clandestine; also difficulty, doubt, ignorance. Reversed: Light, truth, the unravelling of involved matters, public rejoicings; according to another reading, vacillation.",
            detail: "Fruitfulness, action, initiative, length of days; the unknown, clandestine; also difficulty, doubt, ignorance. Reversed: Light, truth, the unravelling of involved matters, public rejoicings; according to another reading, vacillation.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "04-TheEmperor": TarotCardMeaning(
            summary: "Upright: Stability, power, protection, realization; a great person; aid, reason, conviction; also authority and will. Reversed: Benevolence, compassion, credit; also confusion to enemies, obstruction, immaturity.",
            detail: "Stability, power, protection, realization; a great person; aid, reason, conviction; also authority and will. Reversed: Benevolence, compassion, credit; also confusion to enemies, obstruction, immaturity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "05-TheHierophant": TarotCardMeaning(
            summary: "Upright: Marriage, alliance, captivity, servitude; by another account, mercy and goodness; inspiration; the man to whom the Querent has recourse. Reversed: Society, good understanding, concord, overkindness, weakness.",
            detail: "Marriage, alliance, captivity, servitude; by another account, mercy and goodness; inspiration; the man to whom the Querent has recourse. Reversed: Society, good understanding, concord, overkindness, weakness.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "06-TheLovers": TarotCardMeaning(
            summary: "Upright: Attraction, love, beauty, trials overcome. Reversed: Failure, foolish designs. Another account speaks of marriage frustrated and contrarieties of all kinds.",
            detail: "Attraction, love, beauty, trials overcome. Reversed: Failure, foolish designs. Another account speaks of marriage frustrated and contrarieties of all kinds.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "07-TheChariot": TarotCardMeaning(
            summary: "Upright: Succour, providence also war, triumph, presumption, vengeance, trouble. Reversed: Riot, quarrel, dispute, litigation, defeat.",
            detail: "Succour, providence also war, triumph, presumption, vengeance, trouble. Reversed: Riot, quarrel, dispute, litigation, defeat.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "08-Strength": TarotCardMeaning(
            summary: "Upright: Power, energy, action, courage, magnanimity; also complete success and honours. Reversed: Despotism, abuse if power, weakness, discord, sometimes even disgrace.",
            detail: "Power, energy, action, courage, magnanimity; also complete success and honours. Reversed: Despotism, abuse if power, weakness, discord, sometimes even disgrace.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "09-TheHermit": TarotCardMeaning(
            summary: "Upright: Prudence, circumspection; also and especially treason, dissimulation, roguery, corruption. Reversed: Concealment, disguise, policy, fear, unreasoned caution.",
            detail: "Prudence, circumspection; also and especially treason, dissimulation, roguery, corruption. Reversed: Concealment, disguise, policy, fear, unreasoned caution.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "10-WheelOfFortune": TarotCardMeaning(
            summary: "Upright: Destiny, fortune, success, elevation, luck, felicity. Reversed: Increase, abundance, superfluity.",
            detail: "Destiny, fortune, success, elevation, luck, felicity. Reversed: Increase, abundance, superfluity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "11-Justice": TarotCardMeaning(
            summary: "Upright: Equity, rightness, probity, executive; triumph of the deserving side in law. Reversed: Law in all its departments, legal complications, bigotry, bias, excessive severity.",
            detail: "Equity, rightness, probity, executive; triumph of the deserving side in law. Reversed: Law in all its departments, legal complications, bigotry, bias, excessive severity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "12-TheHangedMan": TarotCardMeaning(
            summary: "Upright: Wisdom, circumspection, discernment, trials, sacrifice, intuition, divination, prophecy. Reversed: Selfishness, the crowd, body politic.",
            detail: "Wisdom, circumspection, discernment, trials, sacrifice, intuition, divination, prophecy. Reversed: Selfishness, the crowd, body politic.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "13-Death": TarotCardMeaning(
            summary: "Upright: End, mortality, destruction, corruption also, for a man, the loss of a benefactor for a woman, many contrarieties; for a maid, failure of marriage projects. Reversed: Inertia, sleep, lethargy, petrifaction, somnambulism; hope destroyed.",
            detail: "End, mortality, destruction, corruption also, for a man, the loss of a benefactor for a woman, many contrarieties; for a maid, failure of marriage projects. Reversed: Inertia, sleep, lethargy, petrifaction, somnambulism; hope destroyed.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "14-Temperance": TarotCardMeaning(
            summary: "Upright: Economy, moderation, frugality, management, accommodation. Reversed: Things connected with churches, religions, sects, the priesthood, sometimes even the priest who will marry the Querent; also disunion, unfortunate combinations, competing interests.",
            detail: "Economy, moderation, frugality, management, accommodation. Reversed: Things connected with churches, religions, sects, the priesthood, sometimes even the priest who will marry the Querent; also disunion, unfortunate combinations, competing interests.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "15-TheDevil": TarotCardMeaning(
            summary: "Upright: Ravage, violence, vehemence, extraordinary efforts, force, fatality; that which is predestined but is not for this reason evil. Reversed: Evil fatality, weakness, pettiness, blindness.",
            detail: "Ravage, violence, vehemence, extraordinary efforts, force, fatality; that which is predestined but is not for this reason evil. Reversed: Evil fatality, weakness, pettiness, blindness.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "16-TheTower": TarotCardMeaning(
            summary: "Upright: Misery, distress, indigence, adversity, calamity, disgrace, deception, ruin. It is a card in particular of unforeseen catastrophe. Reversed: According to one account, the same in a lesser degree also oppression, imprisonment, tyranny.",
            detail: "Misery, distress, indigence, adversity, calamity, disgrace, deception, ruin. It is a card in particular of unforeseen catastrophe. Reversed: According to one account, the same in a lesser degree also oppression, imprisonment, tyranny.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "17-TheStar": TarotCardMeaning(
            summary: "Upright: Loss, theft, privation, abandonment; another reading says-hope and bright prospects, Reversed: Arrogance, haughtiness, impotence.",
            detail: "Loss, theft, privation, abandonment; another reading says-hope and bright prospects, Reversed: Arrogance, haughtiness, impotence.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "18-TheMoon": TarotCardMeaning(
            summary: "Upright: Hidden enemies, danger, calumny, darkness, terror, deception, occult forces, error. Reversed: Instability, inconstancy, silence, lesser degrees of deception and error.",
            detail: "Hidden enemies, danger, calumny, darkness, terror, deception, occult forces, error. Reversed: Instability, inconstancy, silence, lesser degrees of deception and error.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "19-TheSun": TarotCardMeaning(
            summary: "Upright: Material happiness, fortunate marriage, contentment. Reversed: The same in a lesser sense.",
            detail: "Material happiness, fortunate marriage, contentment. Reversed: The same in a lesser sense.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "20-Judgement": TarotCardMeaning(
            summary: "Upright: Change of position, renewal, outcome. Another account specifies total loss though lawsuit. Reversed: Weakness, pusillanimity, simplicity; also deliberation, decision, sentence.",
            detail: "Change of position, renewal, outcome. Another account specifies total loss though lawsuit. Reversed: Weakness, pusillanimity, simplicity; also deliberation, decision, sentence.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "21-TheWorld": TarotCardMeaning(
            summary: "Upright: Assured success, recompense, voyage, route, emigration, flight, change of place. Reversed: Inertia, fixity, stagnation, permanence.",
            detail: "Assured success, recompense, voyage, route, emigration, flight, change of place. Reversed: Inertia, fixity, stagnation, permanence.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Part III, Section 3",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pkt0303.htm"
        ),
        "Wands01": TarotCardMeaning(
            summary: "Upright: Creation, invention, enterprise, the powers which result in these; principle, beginning, source; birth, family, origin, and in a sense the virility which is behind them; the starting point of enterprises; according to another account, money, fortune, inheritance. Reversed: Fall, decadence, ruin, perdition, to perish also a certain clouded joy.",
            detail: "A hand issuing from a cloud grasps a stout wand or club. Divinatory Meanings: Creation, invention, enterprise, the powers which result in these; principle, beginning, source; birth, family, origin, and in a sense the virility which is behind them; the starting point of enterprises; according to another account, money, fortune, inheritance. Reversed: Fall, decadence, ruin, perdition, to perish also a certain clouded joy.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ace of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwaac.htm"
        ),
        "Wands02": TarotCardMeaning(
            summary: "Upright: Between the alternative readings there is no marriage possible; on the one hand, riches, fortune, magnificence; on the other, physical suffering, disease, chagrin, sadness, mortification. The design gives one suggestion; here is a lord overlooking his dominion and alternately contemplating a globe; it looks like the malady, the mortification, the sadness of Alexander amidst the grandeur of this world's wealth. Reversed: Surprise, wonder, enchantment, emotion, trouble, fear.",
            detail: "A tall man looks from a battlemented roof over sea and shore; he holds a globe in his right hand, while a staff in his left rests on the battlement; another is fixed in a ring. The Rose and Cross and Lily should be noticed on the left side. Divinatory Meanings: Between the alternative readings there is no marriage possible; on the one hand, riches, fortune, magnificence; on the other, physical suffering, disease, chagrin, sadness, mortification. The design gives one suggestion; here is a lord overlooking his dominion and alternately contemplating a globe; it looks like the malady, the mortification, the sadness of Alexander amidst the grandeur of this world's wealth. Reversed: Surprise, wonder, enchantment, emotion, trouble, fear.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Two of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa02.htm"
        ),
        "Wands03": TarotCardMeaning(
            summary: "Upright: He symbolizes established strength, enterprise, effort, trade, commerce, discovery; those are his ships, bearing his merchandise, which are sailing over the sea. The card also signifies able co-operation in business, as if the successful merchant prince were looking from his side towards yours with a view to help you. Reversed: The end of troubles, suspension or cessation of adversity, toil and disappointment.",
            detail: "A calm, stately personage, with his back turned, looking from a cliff's edge at ships passing over the sea. Three staves are planted in the ground, and he leans slightly on one of them. Divinatory Meanings: He symbolizes established strength, enterprise, effort, trade, commerce, discovery; those are his ships, bearing his merchandise, which are sailing over the sea. The card also signifies able co-operation in business, as if the successful merchant prince were looking from his side towards yours with a view to help you. Reversed: The end of troubles, suspension or cessation of adversity, toil and disappointment.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Three of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa03.htm"
        ),
        "Wands04": TarotCardMeaning(
            summary: "Upright: They are for once almost on the surface--country life, haven of refuge, a species of domestic harvest-home, repose, concord, harmony, prosperity, peace, and the perfected work of these. Reversed: The meaning remains unaltered; it is prosperity, increase, felicity, beauty, embellishment.",
            detail: "From the four great staves planted in the foreground there is a great garland suspended; two female figures uplift nosegays; at their side is a bridge over a moat, leading to an old manorial house. Divinatory Meanings: They are for once almost on the surface--country life, haven of refuge, a species of domestic harvest-home, repose, concord, harmony, prosperity, peace, and the perfected work of these. Reversed: The meaning remains unaltered; it is prosperity, increase, felicity, beauty, embellishment.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Four of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa04.htm"
        ),
        "Wands05": TarotCardMeaning(
            summary: "Upright: Imitation, as, for example, sham fight, but also the strenuous competition and struggle of the search after riches and fortune. In this sense it connects with the battle of life. Hence some attributions say that it is a card of gold, gain, opulence. Reversed: Litigation, disputes, trickery, contradiction.",
            detail: "A posse of youths, who are brandishing staves, as if in sport or strife. It is mimic warfare, and hereto correspond the Divinatory Meanings: Imitation, as, for example, sham fight, but also the strenuous competition and struggle of the search after riches and fortune. In this sense it connects with the battle of life. Hence some attributions say that it is a card of gold, gain, opulence. Reversed: Litigation, disputes, trickery, contradiction.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Five of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa05.htm"
        ),
        "Wands06": TarotCardMeaning(
            summary: "Upright: The card has been so designed that it can cover several significations; on the surface, it is a victor triumphing, but it is also great news, such as might be carried in state by the King's courier; it is expectation crowned with its own desire, the crown of hope, and so forth. Reversed: Apprehension, fear, as of a victorious enemy at the gate; treachery, disloyalty, as of gates being opened to the enemy; also indefinite delay.",
            detail: "A laurelled horseman bears one staff adorned with a laurel crown; footmen with staves are at his side. Divinatory Meanings: The card has been so designed that it can cover several significations; on the surface, it is a victor triumphing, but it is also great news, such as might be carried in state by the King's courier; it is expectation crowned with its own desire, the crown of hope, and so forth. Reversed: Apprehension, fear, as of a victorious enemy at the gate; treachery, disloyalty, as of gates being opened to the enemy; also indefinite delay.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Six of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa06.htm"
        ),
        "Wands07": TarotCardMeaning(
            summary: "Upright: It is a card of valour, for, on the surface, six are attacking one, who has, however, the vantage position. On the intellectual plane, it signifies discussion, wordy strife; in business--negotiations, war of trade, barter, competition. It is further a card of success, for the combatant is on the top and his enemies may be unable to reach him. Reversed: Perplexity, embarrassments, anxiety. It is also a caution against indecision.",
            detail: "A young man on a craggy eminence brandishing a staff; six other staves are raised towards him from below. Divinatory Meanings: It is a card of valour, for, on the surface, six are attacking one, who has, however, the vantage position. On the intellectual plane, it signifies discussion, wordy strife; in business--negotiations, war of trade, barter, competition. It is further a card of success, for the combatant is on the top and his enemies may be unable to reach him. Reversed: Perplexity, embarrassments, anxiety. It is also a caution against indecision.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Seven of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa07.htm"
        ),
        "Wands08": TarotCardMeaning(
            summary: "Upright: Activity in undertakings, the path of such activity, swiftness, as that of an express messenger; great haste, great hope, speed towards an end which promises assured felicity; generally, that which is on the move; also the arrows of love. Reversed: Arrows of jealousy, internal dispute, stingings of conscience, quarrels; and domestic disputes for persons who are married.",
            detail: "The card represents motion through the immovable-a flight of wands through an open country; but they draw to the term of their course. That which they signify is at hand; it may be even on the threshold. Divinatory Meanings: Activity in undertakings, the path of such activity, swiftness, as that of an express messenger; great haste, great hope, speed towards an end which promises assured felicity; generally, that which is on the move; also the arrows of love. Reversed: Arrows of jealousy, internal dispute, stingings of conscience, quarrels; and domestic disputes for persons who are married.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Eight of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa08.htm"
        ),
        "Wands09": TarotCardMeaning(
            summary: "Upright: The card signifies strength in opposition. If attacked, the person will meet an onslaught boldly; and his build shews, that he may prove a formidable antagonist. With this main significance there are all its possible adjuncts--delay, suspension, adjournment. Reversed: Obstacles, adversity, calamity.",
            detail: "The figure leans upon his staff and has an expectant look, as if awaiting an enemy. Behind are eight other staves--erect, in orderly disposition, like a palisade. Divinatory Meanings: The card signifies strength in opposition. If attacked, the person will meet an onslaught boldly; and his build shews, that he may prove a formidable antagonist. With this main significance there are all its possible adjuncts--delay, suspension, adjournment. Reversed: Obstacles, adversity, calamity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Nine of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa09.htm"
        ),
        "Wands10": TarotCardMeaning(
            summary: "Upright: A card of many significances, and some of the readings cannot be harmonized. I set aside that which connects it with honour and good faith. The chief meaning is oppression simply, but it is also fortune, gain, any kind of success, and then it is the oppression of these things. It is also a card of false-seeming, disguise, perfidy. The place which the figure is approaching may suffer from the rods that he carries. Success is stultified if the Nine of Swords follows, and if it is a question of a lawsuit, there will be certain loss. Reversed: Contrarieties, difficulties, intrigues, and their analogies.",
            detail: "A man oppressed by the weight of the ten staves which he is carrying. Divinatory Meanings: A card of many significances, and some of the readings cannot be harmonized. I set aside that which connects it with honour and good faith. The chief meaning is oppression simply, but it is also fortune, gain, any kind of success, and then it is the oppression of these things. It is also a card of false-seeming, disguise, perfidy. The place which the figure is approaching may suffer from the rods that he carries. Success is stultified if the Nine of Swords follows, and if it is a question of a lawsuit, there will be certain loss. Reversed: Contrarieties, difficulties, intrigues, and their analogies.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ten of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwa10.htm"
        ),
        "Wands11": TarotCardMeaning(
            summary: "Upright: Dark young man, faithful, a lover, an envoy, a postman. Beside a man, he will bear favourable testimony concerning him. A dangerous rival, if followed by the Page of Cups. Has the chief qualities of his suit. He may signify family intelligence. Reversed: Anecdotes, announcements, evil news. Also indecision and the instability which accompanies it.",
            detail: "In a scene similar to the former, a young man stands in the act of proclamation. He is unknown but faithful, and his tidings are strange. Divinatory Meanings: Dark young man, faithful, a lover, an envoy, a postman. Beside a man, he will bear favourable testimony concerning him. A dangerous rival, if followed by the Page of Cups. Has the chief qualities of his suit. He may signify family intelligence. Reversed: Anecdotes, announcements, evil news. Also indecision and the instability which accompanies it.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Page of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwapa.htm"
        ),
        "Wands12": TarotCardMeaning(
            summary: "Upright: Departure, absence, flight, emigration. A dark young man, friendly. Change of residence. Reversed: Rupture, division, interruption, discord.",
            detail: "He is shewn as if upon a journey, armed with a short wand, and although mailed is not on a warlike errand. He is passing mounds or pyramids. The motion of the horse is a key to the character of its rider, and suggests the precipitate mood, or things connected therewith. Divinatory Meanings: Departure, absence, flight, emigration. A dark young man, friendly. Change of residence. Reversed: Rupture, division, interruption, discord.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Knight of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwakn.htm"
        ),
        "Wands13": TarotCardMeaning(
            summary: "Upright: A dark woman, countrywoman, friendly, chaste, loving, honourable. If the card beside her signifies a man, she is well disposed towards him; if a woman, she is interested in the Querent. Also, love of money, or a certain success in business. Reversed: Good, economical, obliging, serviceable. Signifies also--but in certain positions and in the neighbourhood of other cards tending in such directions--opposition, jealousy, even deceit and infidelity.",
            detail: "The Wands throughout this suit are always in leaf, as it is a suit of life and animation. Emotionally and otherwise, the Queen's personality corresponds to that of the King, but is more magnetic. Divinatory Meanings: A dark woman, countrywoman, friendly, chaste, loving, honourable. If the card beside her signifies a man, she is well disposed towards him; if a woman, she is interested in the Querent. Also, love of money, or a certain success in business. Reversed: Good, economical, obliging, serviceable. Signifies also--but in certain positions and in the neighbourhood of other cards tending in such directions--opposition, jealousy, even deceit and infidelity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Queen of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwaqu.htm"
        ),
        "Wands14": TarotCardMeaning(
            summary: "Upright: Dark man, friendly, countryman, generally married, honest and conscientious. The card always signifies honesty, and may mean news concerning an unexpected heritage to fall in before very long. Reversed: Good, but severe; austere, yet tolerant.",
            detail: "The physical and emotional nature to which this card is attributed is dark, ardent, lithe, animated, impassioned, noble. The King uplifts a flowering wand, and wears, like his three correspondences in the remaining suits, what is called a cap of maintenance beneath his crown. He connects with the symbol of the lion, which is emblazoned on the back of his throne. Divinatory Meanings: Dark man, friendly, countryman, generally married, honest and conscientious. The card always signifies honesty, and may mean news concerning an unexpected heritage to fall in before very long. Reversed: Good, but severe; austere, yet tolerant.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, King of Wands",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktwaki.htm"
        ),
        "Cups01": TarotCardMeaning(
            summary: "Upright: House of the true heart, joy, content, abode, nourishment, abundance, fertility; Holy Table, felicity hereof. Reversed: House of the false heart, mutation, instability, revolution.",
            detail: "The waters are beneath, and thereon are water-lilies; the hand issues from the cloud, holding in its palm the cup, from which four streams are pouring; a dove, bearing in its bill a cross-marked Host, descends to place the Wafer in the Cup; the dew of water is falling on all sides. It is an intimation of that which may lie behind the Lesser Arcana. Divinatory Meanings: House of the true heart, joy, content, abode, nourishment, abundance, fertility; Holy Table, felicity hereof. Reversed: House of the false heart, mutation, instability, revolution.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ace of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcuac.htm"
        ),
        "Cups02": TarotCardMeaning(
            summary: "Upright: Love, passion, friendship, affinity, union, concord, sympathy, the interrelation of the sexes, and--as a suggestion apart from all offices of divination--that desire which is not in Nature, but by which Nature is sanctified.",
            detail: "A youth and maiden are pledging one another, and above their cups rises the Caduceus of Hermes, between the great wings of which there appears a lion's head. It is a variant of a sign which is found in a few old examples of this card. Some curious emblematical meanings are attached to it, but they do not concern us in this place. Divinatory Meanings: Love, passion, friendship, affinity, union, concord, sympathy, the interrelation of the sexes, and--as a suggestion apart from all offices of divination--that desire which is not in Nature, but by which Nature is sanctified.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Two of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu02.htm"
        ),
        "Cups03": TarotCardMeaning(
            summary: "Upright: The conclusion of any matter in plenty, perfection and merriment; happy issue, victory, fulfilment, solace, healing, Reversed: Expedition, dispatch, achievement, end. It signifies also the side of excess in physical enjoyment, and the pleasures of the senses.",
            detail: "Maidens in a garden-ground with cups uplifted, as if pledging one another. Divinatory Meanings: The conclusion of any matter in plenty, perfection and merriment; happy issue, victory, fulfilment, solace, healing, Reversed: Expedition, dispatch, achievement, end. It signifies also the side of excess in physical enjoyment, and the pleasures of the senses.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Three of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu03.htm"
        ),
        "Cups04": TarotCardMeaning(
            summary: "Upright: Weariness, disgust, aversion, imaginary vexations, as if the wine of this world had caused satiety only; another wine, as if a fairy gift, is now offered the wastrel, but he sees no consolation therein. This is also a card of blended pleasure. Reversed: Novelty, presage, new instruction, new relations.",
            detail: "A young man is seated under a tree and contemplates three cups set on the grass before him; an arm issuing from a cloud offers him another cup. His expression notwithstanding is one of discontent with his environment. Divinatory Meanings: Weariness, disgust, aversion, imaginary vexations, as if the wine of this world had caused satiety only; another wine, as if a fairy gift, is now offered the wastrel, but he sees no consolation therein. This is also a card of blended pleasure. Reversed: Novelty, presage, new instruction, new relations.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Four of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu04.htm"
        ),
        "Cups05": TarotCardMeaning(
            summary: "Upright: A dark, cloaked figure, looking sideways at three prone cups two others stand upright behind him; a bridge is in the background, leading to a small keep or holding. Divanatory Meanings : It is a card of loss, but something remains over; three have been taken, but two are left; it is a card of inheritance, patrimony, transmission, but not corresponding to expectations; with some interpreters it is a card of marriage, but not without bitterness or frustration. Reversed: News, alliances, affinity, consanguinity, ancestry, return, false projects.",
            detail: "A dark, cloaked figure, looking sideways at three prone cups two others stand upright behind him; a bridge is in the background, leading to a small keep or holding. Divanatory Meanings : It is a card of loss, but something remains over; three have been taken, but two are left; it is a card of inheritance, patrimony, transmission, but not corresponding to expectations; with some interpreters it is a card of marriage, but not without bitterness or frustration. Reversed: News, alliances, affinity, consanguinity, ancestry, return, false projects.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Five of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu05.htm"
        ),
        "Cups06": TarotCardMeaning(
            summary: "Upright: A card of the past and of memories, looking back, as--for example--on childhood; happiness, enjoyment, but coming rather from the past; things that have vanished. Another reading reverses this, giving new relations, new knowledge, new environment, and then the children are disporting in an unfamiliar precinct. Reversed: The future, renewal, that which will come to pass presently.",
            detail: "Children in an old garden, their cups filled with flowers. Divinatory Meanings: A card of the past and of memories, looking back, as--for example--on childhood; happiness, enjoyment, but coming rather from the past; things that have vanished. Another reading reverses this, giving new relations, new knowledge, new environment, and then the children are disporting in an unfamiliar precinct. Reversed: The future, renewal, that which will come to pass presently.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Six of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu06.htm"
        ),
        "Cups07": TarotCardMeaning(
            summary: "Upright: Fairy favours, images of reflection, sentiment, imagination, things seen in the glass of contemplation; some attainment in these degrees, but nothing permanent or substantial is suggested. Reversed: Desire, will, determination, project.",
            detail: "Strange chalices of vision, but the images are more especially those of the fantastic spirit. Divinatory Meanings: Fairy favours, images of reflection, sentiment, imagination, things seen in the glass of contemplation; some attainment in these degrees, but nothing permanent or substantial is suggested. Reversed: Desire, will, determination, project.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Seven of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu07.htm"
        ),
        "Cups08": TarotCardMeaning(
            summary: "Upright: The card speaks for itself on the surface, but other readings are entirely antithetical--giving joy, mildness, timidity, honour, modesty. In practice, it is usually found that the card shews the decline of a matter, or that a matter which has been thought to be important is really of slight consequence--either for good or evil. Reversed: Great joy, happiness, feasting.",
            detail: "A man of dejected aspect is deserting the cups of his felicity, enterprise, undertaking or previous concern. Divinatory Meanings: The card speaks for itself on the surface, but other readings are entirely antithetical--giving joy, mildness, timidity, honour, modesty. In practice, it is usually found that the card shews the decline of a matter, or that a matter which has been thought to be important is really of slight consequence--either for good or evil. Reversed: Great joy, happiness, feasting.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Eight of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu08.htm"
        ),
        "Cups09": TarotCardMeaning(
            summary: "Upright: Concord, contentment, physical bien-être ; also victory, success, advantage; satisfaction for the Querent or person for whom the consultation is made. Reversed: Truth, loyalty, liberty; but the readings vary and include mistakes, imperfections, etc.",
            detail: "A goodly personage has feasted to his heart's content, and abundant refreshment of wine is on the arched counter behind him, seeming to indicate that the future is also assured. The picture offers the material side only, but there are other aspects. Divinatory Meanings: Concord, contentment, physical bien-être ; also victory, success, advantage; satisfaction for the Querent or person for whom the consultation is made. Reversed: Truth, loyalty, liberty; but the readings vary and include mistakes, imperfections, etc.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Nine of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu09.htm"
        ),
        "Cups10": TarotCardMeaning(
            summary: "Upright: Contentment, repose of the entire heart; the perfection of that state; also perfection of human love and friendship; if with several picture-cards, a person who is taking charge of the Querent's interests; also the town, village or country inhabited by the Querent. Reversed: Repose of the false heart, indignation, violence.",
            detail: "Appearance of Cups in a rainbow; it is contemplated in wonder and ecstacy by a man and woman below, evidently husband and wife. His right arm is about her; his left is raised upward; she raises her right arm. The two children dancing near them have not observed the prodigy but are happy after their own manner. There is a home-scene beyond. Divinatory Meanings: Contentment, repose of the entire heart; the perfection of that state; also perfection of human love and friendship; if with several picture-cards, a person who is taking charge of the Querent's interests; also the town, village or country inhabited by the Querent. Reversed: Repose of the false heart, indignation, violence.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ten of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcu10.htm"
        ),
        "Cups11": TarotCardMeaning(
            summary: "Upright: Fair young man, one impelled to render service and with whom the Querent will be connected; a studious youth; news, message; application, reflection, meditation; also these things directed to business. Reversed: Taste, inclination, attachment, seduction, deception, artifice.",
            detail: "A fair, pleasing, somewhat effeminate page, of studious and intent aspect, contemplates a fish rising from a cup to look at him. It is the pictures of the mind taking form. Divinatory Meanings: Fair young man, one impelled to render service and with whom the Querent will be connected; a studious youth; news, message; application, reflection, meditation; also these things directed to business. Reversed: Taste, inclination, attachment, seduction, deception, artifice.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Page of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcupa.htm"
        ),
        "Cups12": TarotCardMeaning(
            summary: "Upright: Arrival, approach--sometimes that of a messenger; advances, proposition, demeanour, invitation, incitement. Reversed: Trickery, artifice, subtlety, swindling, duplicity, fraud.",
            detail: "Graceful, but not warlike; riding quietly, wearing a winged helmet, referring to those higher graces of the imagination which sometimes characterize this card. He too is a dreamer, but the images of the side of sense haunt him in his vision. Divinatory Meanings: Arrival, approach--sometimes that of a messenger; advances, proposition, demeanour, invitation, incitement. Reversed: Trickery, artifice, subtlety, swindling, duplicity, fraud.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Knight of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcukn.htm"
        ),
        "Cups13": TarotCardMeaning(
            summary: "Upright: Good, fair woman; honest, devoted woman, who will do service to the Querent; loving intelligence, and hence the gift of vision; success, happiness, pleasure; also wisdom, virtue; a perfect spouse and a good mother. Reversed: The accounts vary; good woman; otherwise, distinguished woman but one not to be trusted; perverse woman; vice, dishonour, depravity.",
            detail: "Beautiful, fair, dreamy--as one who sees visions in a cup. This is, however, only one of her aspects; she sees, but she also acts, and her activity feeds her dream. Divinatory Meanings: Good, fair woman; honest, devoted woman, who will do service to the Querent; loving intelligence, and hence the gift of vision; success, happiness, pleasure; also wisdom, virtue; a perfect spouse and a good mother. Reversed: The accounts vary; good woman; otherwise, distinguished woman but one not to be trusted; perverse woman; vice, dishonour, depravity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Queen of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcuqu.htm"
        ),
        "Cups14": TarotCardMeaning(
            summary: "Upright: Fair man, man of business, law, or divinity; responsible, disposed to oblige the Querent; also equity, art and science, including those who profess science, law and art; creative intelligence. Reversed: Dishonest, double-dealing man; roguery, exaction, injustice, vice, scandal, pillage, considerable loss.",
            detail: "He holds a short sceptre in his left hand and a great cup in his right; his throne is set upon the sea; on one side a ship is riding and on the other a dolphin is leaping. The implicit is that the Sign of the Cup naturally refers to water, which appears in all the court cards. Divinatory Meanings: Fair man, man of business, law, or divinity; responsible, disposed to oblige the Querent; also equity, art and science, including those who profess science, law and art; creative intelligence. Reversed: Dishonest, double-dealing man; roguery, exaction, injustice, vice, scandal, pillage, considerable loss.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, King of Cups",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktcuki.htm"
        ),
        "Swords01": TarotCardMeaning(
            summary: "Upright: Triumph, the excessive degree in everything, conquest, triumph of force. It is a card of great force, in love as well as in hatred. The crown may carry a much higher significance than comes usually within the sphere of fortune-telling. Reversed: The same, but the results are disastrous; another account says--conception, childbirth, augmentation, multiplicity.",
            detail: "A hand issues from a cloud, grasping as word, the point of which is encircled by a crown. Divinatory Meanings: Triumph, the excessive degree in everything, conquest, triumph of force. It is a card of great force, in love as well as in hatred. The crown may carry a much higher significance than comes usually within the sphere of fortune-telling. Reversed: The same, but the results are disastrous; another account says--conception, childbirth, augmentation, multiplicity.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ace of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktswac.htm"
        ),
        "Swords02": TarotCardMeaning(
            summary: "Upright: Conformity and the equipoise which it suggests, courage, friendship, concord in a state of arms; another reading gives tenderness, affection, intimacy. The suggestion of harmony and other favourable readings must be considered in a qualified manner, as Swords generally are not symbolical of beneficent forces in human affairs. Reversed: Imposture, falsehood, duplicity, disloyalty.",
            detail: "A hoodwinked female figure balances two swords upon her shoulders. Divinatory Meanings: Conformity and the equipoise which it suggests, courage, friendship, concord in a state of arms; another reading gives tenderness, affection, intimacy. The suggestion of harmony and other favourable readings must be considered in a qualified manner, as Swords generally are not symbolical of beneficent forces in human affairs. Reversed: Imposture, falsehood, duplicity, disloyalty.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Two of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw02.htm"
        ),
        "Swords03": TarotCardMeaning(
            summary: "Upright: Removal, absence, delay, division, rupture, dispersion, and all that the design signifies naturally, being too simple and obvious to call for specific enumeration. Reversed: Mental alienation, error, loss, distraction, disorder, confusion.",
            detail: "Three swords piercing a heart; cloud and rain behind. Divinatory Meanings: Removal, absence, delay, division, rupture, dispersion, and all that the design signifies naturally, being too simple and obvious to call for specific enumeration. Reversed: Mental alienation, error, loss, distraction, disorder, confusion.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Three of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw03.htm"
        ),
        "Swords04": TarotCardMeaning(
            summary: "Upright: Vigilance, retreat, solitude, hermit's repose, exile, tomb and coffin. It is these last that have suggested the design. Reversed: Wise administration, circumspection, economy, avarice, precaution, testament.",
            detail: "The effigy of a knight in the attitude of prayer, at full length upon his tomb. Divinatory Meanings: Vigilance, retreat, solitude, hermit's repose, exile, tomb and coffin. It is these last that have suggested the design. Reversed: Wise administration, circumspection, economy, avarice, precaution, testament.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Four of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw04.htm"
        ),
        "Swords05": TarotCardMeaning(
            summary: "Upright: Degradation, destruction, revocation, infamy, dishonour, loss, with the variants and analogues of these. Reversed: The same; burial and obsequies.",
            detail: "A disdainful man looks after two retreating and dejected figures. Their swords lie upon the ground. He carries two others on his left shoulder, and a third sword is in his right hand, point to earth. He is the master in possession of the field. Divinatory Meanings: Degradation, destruction, revocation, infamy, dishonour, loss, with the variants and analogues of these. Reversed: The same; burial and obsequies.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Five of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw05.htm"
        ),
        "Swords06": TarotCardMeaning(
            summary: "Upright: journey by water, route, way, envoy, commissionary, expedient. Reversed: Declaration, confession, publicity; one account says that it is a proposal of love.",
            detail: "A ferryman carrying passengers in his punt to the further shore. The course is smooth, and seeing that the freight is light, it may be noted that the work is not beyond his strength. Divinatory Meanings: journey by water, route, way, envoy, commissionary, expedient. Reversed: Declaration, confession, publicity; one account says that it is a proposal of love.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Six of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw06.htm"
        ),
        "Swords07": TarotCardMeaning(
            summary: "Upright: Design, attempt, wish, hope, confidence; also quarrelling, a plan that may fail, annoyance. The design is uncertain in its import, because the significations are widely at variance with each other. Reversed: Good advice, counsel, instruction, slander, babbling.",
            detail: "A man in the act of carrying away five swords rapidly; the two others of the card remain stuck in the ground. A camp is close at hand. Divinatory Meanings: Design, attempt, wish, hope, confidence; also quarrelling, a plan that may fail, annoyance. The design is uncertain in its import, because the significations are widely at variance with each other. Reversed: Good advice, counsel, instruction, slander, babbling.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Seven of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw07.htm"
        ),
        "Swords08": TarotCardMeaning(
            summary: "Upright: Bad news, violent chagrin, crisis, censure, power in trammels, conflict, calumny; also sickness. Reversed: Disquiet, difficulty, opposition, accident, treachery; what is unforeseen; fatality.",
            detail: "A woman, bound and hoodwinked, with the swords of the card about her. Yet it is rather a card of temporary durance than of irretrievable bondage. Divinatory Meanings: Bad news, violent chagrin, crisis, censure, power in trammels, conflict, calumny; also sickness. Reversed: Disquiet, difficulty, opposition, accident, treachery; what is unforeseen; fatality.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Eight of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw08.htm"
        ),
        "Swords09": TarotCardMeaning(
            summary: "Upright: Death, failure, miscarriage, delay, deception, disappointment, despair. Reversed: Imprisonment, suspicion, doubt, reasonable fear, shame.",
            detail: "One seated on her couch in lamentation, with the swords over her. She is as one who knows no sorrow which is like unto hers. It is a card of utter desolation. Divinatory Meanings: Death, failure, miscarriage, delay, deception, disappointment, despair. Reversed: Imprisonment, suspicion, doubt, reasonable fear, shame.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Nine of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw09.htm"
        ),
        "Swords10": TarotCardMeaning(
            summary: "Upright: Whatsoever is intimated by the design; also pain, affliction, tears, sadness, desolation. It is not especially a card of violent death. Reversed: Advantage, profit, success, favour, but none of these are permanent; also power and authority.",
            detail: "A prostrate figure, pierced by all the swords belonging to the card. Divinatory Meanings: Whatsoever is intimated by the design; also pain, affliction, tears, sadness, desolation. It is not especially a card of violent death. Reversed: Advantage, profit, success, favour, but none of these are permanent; also power and authority.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ten of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktsw10.htm"
        ),
        "Swords11": TarotCardMeaning(
            summary: "Upright: Authority, overseeing, secret service, vigilance, spying, examination, and the qualities thereto belonging. Reversed: More evil side of these qualities; what is unforeseen, unprepared state; sickness is also intimated.",
            detail: "A lithe, active figure holds a sword upright in both hands, while in the act of swift walking. He is passing over rugged land, and about his way the clouds are collocated wildly. He is alert and lithe, looking this way and that, as if an expected enemy might appear at any moment. Divinatory Meanings: Authority, overseeing, secret service, vigilance, spying, examination, and the qualities thereto belonging. Reversed: More evil side of these qualities; what is unforeseen, unprepared state; sickness is also intimated.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Page of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktswpa.htm"
        ),
        "Swords12": TarotCardMeaning(
            summary: "Upright: Skill, bravery, capacity, defence, address, enmity, wrath, war, destruction, opposition, resistance, ruin. There is therefore a sense in which the card signifies death, but it carries this meaning only in its proximity to other cards of fatality. Reversed: Imprudence, incapacity, extravagance.",
            detail: "He is riding in full course, as if scattering his enemies. In the design he is really a prototypical hero of romantic chivalry. He might almost be Galahad, whose sword is swift and sure because he is clean of heart. Divinatory Meanings: Skill, bravery, capacity, defence, address, enmity, wrath, war, destruction, opposition, resistance, ruin. There is therefore a sense in which the card signifies death, but it carries this meaning only in its proximity to other cards of fatality. Reversed: Imprudence, incapacity, extravagance.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Knight of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktswkn.htm"
        ),
        "Swords13": TarotCardMeaning(
            summary: "Upright: Widowhood, female sadness and embarrassment, absence, sterility, mourning, privation, separation. Reversed: Malice, bigotry, artifice, prudery, bale, deceit.",
            detail: "Her right hand raises the weapon vertically and the hilt rests on an arm of her royal chair the left hand is extended, the arm raised her countenance is severe but chastened; it suggests familiarity with sorrow. It does not represent mercy, and, her sword notwithstanding, she is scarcely a symbol of power. Divinatory Meanings: Widowhood, female sadness and embarrassment, absence, sterility, mourning, privation, separation. Reversed: Malice, bigotry, artifice, prudery, bale, deceit.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Queen of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktswqu.htm"
        ),
        "Swords14": TarotCardMeaning(
            summary: "Upright: Whatsoever arises out of the idea of judgment and all its connexions-power, command, authority, militant intelligence, law, offices of the crown, and so forth. Reversed: Cruelty, perversity, barbarity, perfidy, evil intention.",
            detail: "He sits in judgment, holding the unsheathed sign of his suit. He recalls, of course, the conventional Symbol of justice in the Trumps Major, and he may represent this virtue, but he is rather the power of life and death, in virtue of his office. Divinatory Meanings: Whatsoever arises out of the idea of judgment and all its connexions-power, command, authority, militant intelligence, law, offices of the crown, and so forth. Reversed: Cruelty, perversity, barbarity, perfidy, evil intention.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, King of Swords",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktswki.htm"
        ),
        "Pentacles01": TarotCardMeaning(
            summary: "Upright: Perfect contentment, felicity, ecstasy; also speedy intelligence; gold. Reversed: The evil side of wealth, bad intelligence; also great riches. In any case it shews prosperity, comfortable material conditions, but whether these are of advantage to the possessor will depend on whether the card is reversed or not.",
            detail: "A hand--issuing, as usual, from a cloud--holds up a pentacle. Divinatory Meanings: Perfect contentment, felicity, ecstasy; also speedy intelligence; gold. Reversed: The evil side of wealth, bad intelligence; also great riches. In any case it shews prosperity, comfortable material conditions, but whether these are of advantage to the possessor will depend on whether the card is reversed or not.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ace of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpeac.htm"
        ),
        "Pentacles02": TarotCardMeaning(
            summary: "Upright: On the one hand it is represented as a card of gaiety, recreation and its connexions, which is the subject of the design; but it is read also as news and messages in writing, as obstacles, agitation, trouble, embroilment. Reversed: Enforced gaiety, simulated enjoyment, literal sense, handwriting, composition, letters of exchange.",
            detail: "A young man, in the act of dancing, has a pentacle in either hand, and they are joined by that endless cord which is like the number 8 reversed. Divinatory Meanings: On the one hand it is represented as a card of gaiety, recreation and its connexions, which is the subject of the design; but it is read also as news and messages in writing, as obstacles, agitation, trouble, embroilment. Reversed: Enforced gaiety, simulated enjoyment, literal sense, handwriting, composition, letters of exchange.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Two of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe02.htm"
        ),
        "Pentacles03": TarotCardMeaning(
            summary: "Upright: Métier , trade, skilled labour; usually, however, regarded as a card of nobility, aristocracy, renown, glory. Reversed: Mediocrity, in work and otherwise, puerility, pettiness, weakness.",
            detail: "A sculptor at his work in a monastery. Compare the design which illustrates the Eight of Pentacles. The apprentice or amateur therein has received his reward and is now at work in earnest. Divinatory Meanings: Métier , trade, skilled labour; usually, however, regarded as a card of nobility, aristocracy, renown, glory. Reversed: Mediocrity, in work and otherwise, puerility, pettiness, weakness.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Three of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe03.htm"
        ),
        "Pentacles04": TarotCardMeaning(
            summary: "Upright: The surety of possessions, cleaving to that which one has, gift, legacy, inheritance. Reversed: Suspense, delay, opposition.",
            detail: "A crowned figure, having a pentacle over his crown, clasps another with hands and arms; two pentacles are under his feet. He holds to that which he has. Divinatory Meanings: The surety of possessions, cleaving to that which one has, gift, legacy, inheritance. Reversed: Suspense, delay, opposition.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Four of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe04.htm"
        ),
        "Pentacles05": TarotCardMeaning(
            summary: "Upright: The card foretells material trouble above all, whether in the form illustrated--that is, destitution--or otherwise. For some cartomancists, it is a card of love and lovers-wife, husband, friend, mistress; also concordance, affinities. These alternatives cannot be harmonized. Reversed: Disorder, chaos, ruin, discord, profligacy.",
            detail: "Two mendicants in a snow-storm pass a lighted casement. Divinatory Meanings: The card foretells material trouble above all, whether in the form illustrated--that is, destitution--or otherwise. For some cartomancists, it is a card of love and lovers-wife, husband, friend, mistress; also concordance, affinities. These alternatives cannot be harmonized. Reversed: Disorder, chaos, ruin, discord, profligacy.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Five of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe05.htm"
        ),
        "Pentacles06": TarotCardMeaning(
            summary: "Upright: Presents, gifts, gratification another account says attention, vigilance now is the accepted time, present prosperity, etc. Reversed: Desire, cupidity, envy, jealousy, illusion.",
            detail: "A person in the guise of a merchant weighs money in a pair of scales and distributes it to the needy and distressed. It is a testimony to his own success in life, as well as to his goodness of heart. Divinatory Meanings: Presents, gifts, gratification another account says attention, vigilance now is the accepted time, present prosperity, etc. Reversed: Desire, cupidity, envy, jealousy, illusion.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Six of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe06.htm"
        ),
        "Pentacles07": TarotCardMeaning(
            summary: "Upright: These are exceedingly contradictory; in the main, it is a card of money, business, barter; but one reading gives altercation, quarrels--and another innocence, ingenuity, purgation. Reversed: Cause for anxiety regarding money which it may be proposed to lend.",
            detail: "A young man, leaning on his staff, looks intently at seven pentacles attached to a clump of greenery on his right; one would say that these were his treasures and that his heart was there. Divinatory Meanings: These are exceedingly contradictory; in the main, it is a card of money, business, barter; but one reading gives altercation, quarrels--and another innocence, ingenuity, purgation. Reversed: Cause for anxiety regarding money which it may be proposed to lend.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Seven of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe07.htm"
        ),
        "Pentacles08": TarotCardMeaning(
            summary: "Upright: Work, employment, commission, craftsmanship, skill in craft and business, perhaps in the preparatory stage. Reversed: Voided ambition, vanity, cupidity, exaction, usury. It may also signify the possession of skill, in the sense of the ingenious mind turned to cunning and intrigue.",
            detail: "An artist in stone at his work, which he exhibits in the form of trophies. Divinatory Meanings: Work, employment, commission, craftsmanship, skill in craft and business, perhaps in the preparatory stage. Reversed: Voided ambition, vanity, cupidity, exaction, usury. It may also signify the possession of skill, in the sense of the ingenious mind turned to cunning and intrigue.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Eight of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe08.htm"
        ),
        "Pentacles09": TarotCardMeaning(
            summary: "Upright: Prudence, safety, success, accomplishment, certitude, discernment. Reversed: Roguery, deception, voided project, bad faith.",
            detail: "A woman, with a bird upon her wrist, stands amidst a great abundance of grapevines in the garden of a manorial house. It is a wide domain, suggesting plenty in all things. Possibly it is her own possession and testifies to material well-being. Divinatory Meanings: Prudence, safety, success, accomplishment, certitude, discernment. Reversed: Roguery, deception, voided project, bad faith.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Nine of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe09.htm"
        ),
        "Pentacles10": TarotCardMeaning(
            summary: "Upright: Gain, riches; family matters, archives, extraction, the abode of a family. Reversed: Chance, fatality, loss, robbery, games of hazard; sometimes gift, dowry, pension.",
            detail: "A man and woman beneath an archway which gives entrance to a house and domain. They are accompanied by a child, who looks curiously at two dogs accosting an ancient personage seated in the foreground. The child's hand is on one of them. Divinatory Meanings: Gain, riches; family matters, archives, extraction, the abode of a family. Reversed: Chance, fatality, loss, robbery, games of hazard; sometimes gift, dowry, pension.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Ten of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpe10.htm"
        ),
        "Pentacles11": TarotCardMeaning(
            summary: "Upright: Application, study, scholarship, reflection another reading says news, messages and the bringer thereof; also rule, management. Reversed: Prodigality, dissipation, liberality, luxury; unfavourable news.",
            detail: "A youthful figure, looking intently at the pentacle which hovers over his raised hands. He moves slowly, insensible of that which is about him. Divinatory Meanings: Application, study, scholarship, reflection another reading says news, messages and the bringer thereof; also rule, management. Reversed: Prodigality, dissipation, liberality, luxury; unfavourable news.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Page of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpepa.htm"
        ),
        "Pentacles12": TarotCardMeaning(
            summary: "Upright: Utility, serviceableness, interest, responsibility, rectitude-all on the normal and external plane. Reversed: inertia, idleness, repose of that kind, stagnation; also placidity, discouragement, carelessness.",
            detail: "He rides a slow, enduring, heavy horse, to which his own aspect corresponds. He exhibits his symbol, but does not look therein. Divinatory Meanings: Utility, serviceableness, interest, responsibility, rectitude-all on the normal and external plane. Reversed: inertia, idleness, repose of that kind, stagnation; also placidity, discouragement, carelessness.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Knight of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpekn.htm"
        ),
        "Pentacles13": TarotCardMeaning(
            summary: "Upright: Opulence, generosity, magnificence, security, liberty. Reversed: Evil, suspicion, suspense, fear, mistrust.",
            detail: "The face suggests that of a dark woman, whose qualities might be summed up in the idea of greatness of soul; she has also the serious cast of intelligence; she contemplates her symbol and may see worlds therein. Divinatory Meanings: Opulence, generosity, magnificence, security, liberty. Reversed: Evil, suspicion, suspense, fear, mistrust.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, Queen of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpequ.htm"
        ),
        "Pentacles14": TarotCardMeaning(
            summary: "Upright: Valour, realizing intelligence, business and normal intellectual aptitude, sometimes mathematical gifts and attainments of this kind; success in these paths. Reversed: Vice, weakness, ugliness, perversity, corruption, peril.",
            detail: "The figure calls for no special description the face is rather dark, suggesting also courage, but somewhat lethargic in tendency. The bull's head should be noted as a recurrent symbol on the throne. The sign of this suit is represented throughout as engraved or blazoned with the pentagram, typifying the correspondence of the four elements in human nature and that by which they may be governed. In many old Tarot packs this suit stood for current coin, money, deniers. I have not invented the substitution of pentacles and I have no special cause to sustain in respect of the alternative. But the consensus of divinatory meanings is on the side of some change, because the cards do not happen to deal especially with questions of money. Divinatory Meanings: Valour, realizing intelligence, business and normal intellectual aptitude, sometimes mathematical gifts and attainments of this kind; success in these paths. Reversed: Vice, weakness, ugliness, perversity, corruption, peril.",
            sourceTitle: "A.E. Waite, The Pictorial Key to the Tarot, King of Pentacles",
            sourceURL: "https://sacred-texts.com/tarot/pkt/pktpeki.htm"
        ),
    ]
}
