//
//  SetGame.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import Foundation


struct SetGame<CardContent> {
    var cards: [Card]
    
    struct Card {
        var content: CardContent
        var isSelected: Bool
        var isMatched: Bool
    }
}
