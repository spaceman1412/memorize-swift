//
//  SetGame.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import Foundation


struct SetGame<CardContent: Equatable> {
    var cards: [Card]
    
    struct Card: Equatable, Identifiable {
        var content: CardContent
        var isSelected: Bool = false
        var isMatched: Bool = false
        var id: String
    }
    
    
    private let numberOfCards: Int
    
    private let randomCardContentFactory: () -> CardContent
    
    private(set) var score: Int = 0
    
    
    init(numberOfCards: Int,  randomCardContentFactory: @escaping () -> CardContent) {
        self.numberOfCards = numberOfCards
        self.randomCardContentFactory = randomCardContentFactory
        
        cards = []
        for index in 0..<numberOfCards {
            let card = Card(content: randomCardContentFactory(), id: String(index))
            cards.append(card)
        }
    }
    
    mutating func createNewGame() {
        cards = []
        for index in 0..<numberOfCards {
            let card = Card(content: randomCardContentFactory(), id: String(index))
            cards.append(card)
        }
    }
    
    private var selectedCards: [Card] {
        cards.filter { card in
            card.isSelected
        }
    }
    
    mutating func choose(_ chosenCard:Card) {
        if let index = cards.firstIndex(where: {
            $0.id == chosenCard.id
        }) {
            if cards[index].isSelected {
                cards[index].isSelected = false
            } else {
//                let currentMatched = { () -> Bool in
//                     Check if the current card is match with the other 2 or not
//                    for content in cards[index].content {
//                        var count = 0
//                        
//                        for card in selectedCards {
//                            for selectedCardContent in card.content {
//                                if selectedCardContent == content {
//                                    
//                                }
//                            }
//                        }
//                    }
//                }
            }
        }
        
    }
    
    mutating func dealThreeCards() {
        // TODO: Check if the index is right or not or it maybe duplicate
        //        for index in 0..<numberOfCards {
//            let card = Card(content: randomCardContentFactory(), id: String(cards.count + 1 + index))
//            cards.append(card)
//        }
    }
    
}
