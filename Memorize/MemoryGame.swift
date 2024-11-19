//
//  MemorizeGame.swift
//  Memorize
//
//  Created by H470-088 on 12/11/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfPairs) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter({ index in cards[index].isFaceUp == true}).only // [Int].count == 1 ? [Int].first : nil
        }
        set {
            cards.indices.forEach({index in
                cards[index].isFaceUp = index == newValue
            })
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {
            $0.id == card.id
        }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content  == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        print("matched")
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var id: String
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        
    }
    
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
