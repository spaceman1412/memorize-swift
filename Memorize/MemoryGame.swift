//
//  MemorizeGame.swift
//  Memorize
//
//  Created by H470-088 on 12/11/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
