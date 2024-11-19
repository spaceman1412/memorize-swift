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
        Theme(name: "Rainbow", emojis: ["🌈", "☀️", "🌧", "🌩", "❄️"], numberOfPairs: 5, color: "Purple"),
        Theme(name: "Fire", emojis: ["🔥", "🌋", "☄️", "💥", "🕯"], numberOfPairs: 5, color: "Red"),
        Theme(name: "Ocean", emojis: ["🌊", "🐚", "🐠", "🐳", "🦀"], numberOfPairs: 5, color: "Blue"),
        Theme(name: "Night Sky", emojis: ["🌟", "🌙", "✨", "🌌", "🪐"], numberOfPairs: 5, color: "Yellow"),
        Theme(name: "Nature", emojis: ["🍀", "🌿", "🌳", "🍂", "🌻"], numberOfPairs: 5, color: "Green"),
        Theme(name: "Art", emojis: ["🎨", "🖌", "🖼", "🎭", "✏️"], numberOfPairs: 5, color: "Pink")
    ]
    
    private(set) var themeName: String
    
    private static let colorData: [String:Color] = ["Purple": .purple, "Red": .red, "Blue": .blue, "Yellow": .yellow, "Green": .green, "Pink": .pink]
    
    private(set) var cardColor: Color
    
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairs: theme.numberOfPairs) { pairIndex in
            if theme.emojis.shuffled().indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
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
        cardColor = EmojiMemoryGame.colorData[randomTheme.color] ?? .black
        game = EmojiMemoryGame.createMemoryGame(withTheme: randomTheme)
    }

    //MARK: - Intents
    
    func createNewGame() {
        let randomTheme = EmojiMemoryGame.themes[Int.random(in: EmojiMemoryGame.themes.indices)]
        themeName = randomTheme.name
        cardColor = EmojiMemoryGame.colorData[randomTheme.color] ?? .black
        game = EmojiMemoryGame.createMemoryGame(withTheme: randomTheme)
    }
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
