//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by H470-088 on 12/11/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🎃", "👻", "🕷️", "💀", "🧙‍♀️", "🦇", "🐶", "🐱", "🐰", "🐼"]
    
    let themes: [Theme] = [
        Theme(name: "Rainbow", emojis: ["🌈", "☀️", "🌧", "🌩", "❄️"], numberOfPairs: 5, color: "Multicolor"),
        Theme(name: "Fire", emojis: ["🔥", "🌋", "☄️", "💥", "🕯"], numberOfPairs: 5, color: "Red"),
        Theme(name: "Ocean", emojis: ["🌊", "🐚", "🐠", "🐳", "🦀"], numberOfPairs: 5, color: "Blue"),
        Theme(name: "Night Sky", emojis: ["🌟", "🌙", "✨", "🌌", "🪐"], numberOfPairs: 5, color: "Yellow"),
        Theme(name: "Nature", emojis: ["🍀", "🌿", "🌳", "🍂", "🌻"], numberOfPairs: 5, color: "Green"),
        Theme(name: "Art", emojis: ["🎨", "🖌", "🖼", "🎭", "✏️"], numberOfPairs: 5, color: "Pink")
    ]

    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairs: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🙏"
            }
            
        }
    }
    
    @Published private var game = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    struct Theme {
        let name: String
        let emojis: [String]
        let numberOfPairs: Int
        let color: String
    }

    //MARK: - Intents
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
