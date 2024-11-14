//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by H470-088 on 12/11/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🎃", "👻", "🕷️", "💀", "🧙‍♀️", "🦇", "🐶", "🐱", "🐰", "🐼"]
    
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
    
    //MARK: - Intents
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
