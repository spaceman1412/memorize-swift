//
//  SetGame.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import Foundation


struct SetGame<CardContent: Equatable> {
    var cards: [Card]
    
    struct Card: Equatable {
        var content: CardContent
        var isSelected: Bool = false
        var isMatched: Bool = false
    }
    
    
    init(numberOfCards: Int, randomCardContentFactory: () -> CardContent) {
        cards = []
        for _ in 0..<numberOfCards {
            let card = Card(content: randomCardContentFactory())
            cards.append(card)
        }
    }
}
