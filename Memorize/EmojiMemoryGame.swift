//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by H470-088 on 12/11/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🎃", "👻", "🕷️", "💀", "🧙‍♀️", "🦇", "🐶", "🐱", "🐰", "🐼"]
    
    private static let themes: [Theme] = [
        Theme(name: "Rainbow", emojis: ["🌈", "☀️", "🌧", "🌩", "❄️"], numberOfPairs: Int.random(in: 0..<10), color: "Multiple"),
        Theme(name: "Fire", emojis: ["🔥", "🌋", "☄️", "💥", "🕯"], numberOfPairs: Int.random(in: 0..<10), color: "Red"),
        Theme(name: "Ocean", emojis: ["🌊", "🐚", "🐠", "🐳", "🦀"], numberOfPairs: Int.random(in: 0..<10), color: "Blue"),
        Theme(name: "Night Sky", emojis: ["🌟", "🌙", "✨", "🌌", "🪐"], numberOfPairs: Int.random(in: 0..<10), color: "Yellow"),
        Theme(name: "Nature", emojis: ["🍀", "🌿", "🌳", "🍂", "🌻"], numberOfPairs: Int.random(in: 0..<10), color: "Green"),
        Theme(name: "Art", emojis: ["🎨", "🖌", "🖼", "🎭", "✏️"], numberOfPairs: Int.random(in: 0..<10), color: "Pink")
    ]
    
    private(set) var themeName: String
    
    private static let colorData: [String:ColorGradient] = ["Multiple":.gradient(Gradient(colors: [.red,.green,.blue])), "Red": .color(.red), "Blue": .color(.blue), "Yellow": .color(.yellow), "Green": .color(.green), "Pink": .color(.pink)]
    
    private(set) var cardColor: ColorGradient
    
    
    enum ColorGradient: ShapeStyle {
        case color(Color)
        case gradient(Gradient)
        
        var value: some ShapeStyle {
            switch self {
            case .color(let view):
                AnyShapeStyle(view)
            case .gradient(let view):
                AnyShapeStyle(view)
            }
        }
    }
    
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairs: theme.numberOfPairs) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                // Shuffle for not have dead emojis
                return theme.emojis.shuffled()[pairIndex]
            } else {
                return "🙏"
            }
        }
    }
    
    @Published private var game: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    var score: Int {
        return game.score
    }
    
    struct Theme {
        let name: String
        let emojis: [String]
        let numberOfPairs: Int
        let color: String
    }
    
    
    init() {
        let randomTheme = EmojiMemoryGame.themes[Int.random(in: EmojiMemoryGame.themes.indices)]
        themeName = randomTheme.name
        cardColor = EmojiMemoryGame.colorData[randomTheme.color] ?? .color(.black)
        game = EmojiMemoryGame.createMemoryGame(withTheme: randomTheme)
    }

    //MARK: - Intents
    
    func createNewGame() {
        let randomTheme = EmojiMemoryGame.themes[Int.random(in: EmojiMemoryGame.themes.indices)]
        themeName = randomTheme.name
        cardColor = EmojiMemoryGame.colorData[randomTheme.color] ?? .color(.black)
        game = EmojiMemoryGame.createMemoryGame(withTheme: randomTheme)
    }
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
