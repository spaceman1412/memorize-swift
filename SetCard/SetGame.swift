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
        var isSelected: Bool = false {
            didSet {
                if oldValue && !isSelected {
                    isSeen = true
                }
            }
        }
        var isSeen: Bool = false
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
    
    private var indexSelectedCards: [Int]? {
        get {
            let indexArr = cards.indices.filter { index in
                cards[index].isSelected
            }
            
            if indexArr.count <= 2 {
                return indexArr
            }
            
            return nil
        }
        set {
            cards.indices.forEach { index in
                if let indexArr = newValue {
                    if !indexArr.contains(index) {
                        cards[index].isSelected = false
                    }
                }
            }
        }
    }
    
    mutating func choose(_ chosenCard:Card, compare: (CardContent, CardContent, CardContent) -> Bool) {
        if let index = cards.firstIndex(where: {
            $0.id == chosenCard.id
        }) {
            if cards[index].isSelected {
                // Deselect card
                cards[index].isSelected = false
            } else {
                if let indexArr = indexSelectedCards, indexArr.count == 2 {
                    if compare(cards[indexArr[0]].content, cards[indexArr[1]].content, cards[index].content)  {
                        cards[indexArr[0]].isMatched = true
                        cards[indexArr[1]].isMatched = true
                        cards[index].isMatched = true
                        score += 2
                    } else {
                        if cards[index].isSeen {
                            score -= 1
                        }
                        if cards[indexArr[0]].isSeen {
                            score -= 1
                        }
                        if cards[indexArr[1]].isSeen {
                            score -= 1
                        }
                        
                        indexSelectedCards = [index]
                    }
                } else {
                    if var indexArrr = indexSelectedCards {
                        var copArr = indexArrr
                        copArr.append(index)
                        indexSelectedCards = copArr
                    } else {
                        indexSelectedCards = [index]
                    }
                }
                cards[index].isSelected = true
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


