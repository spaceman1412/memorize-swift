//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by H470-088 on 12/11/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    private static let emojis = ["🎃", "👻", "🕷️", "💀", "🧙‍♀️", "🦇", "🐶", "🐱", "🐰", "🐼"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairs: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🙏"
            }
            
        }
    }
    
    @Published private var game = createMemoryGame()
    
    var cards: Array<Card> {
        return game.cards
    }
    
    var color: Color {
        return .orange
    }
    
    //MARK: - Intents
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: Card) {
        game.choose(card)
    }
}
