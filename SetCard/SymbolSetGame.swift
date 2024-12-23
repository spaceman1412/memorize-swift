//
//  SymbolSetGame.swift
//  SetCard
//
//  Created by H470-088 on 3/12/24.
//

import SwiftUI


class SymbolSetGame: ObservableObject {
    struct Symbol: Equatable {
        var color: SymbolColor
        var symbol: SymbolShape
        var typeColor: ColorType
        var numberSymbol: SymbolNumber
        
        enum SymbolColor: String,CaseIterable {
            case green
            case blue
            case red
            
            var mainColor: Color {
                switch self {
                case .green:
                    Color.green
                
                case .blue:
                    Color.blue
                
                case .red:
                    Color.red
                }
            }
        }
        
        
        enum SymbolShape: CaseIterable {
            case diamond
            case oval
            case squiggle
        }
        
        enum ColorType: CaseIterable {
            case fill
            case stroke
            case stripped
        }
        
        enum SymbolNumber: Int, CaseIterable {
            case one = 1
            case two = 2
            case three = 3
        }
    }
    
    typealias Card = SetGame<Symbol>.Card
    
    static func createSetGame() -> SetGame<Symbol> {
        SetGame(numberOfCards: 40) {
            Symbol(color: .allCases.randomElement()!, symbol: .allCases.randomElement()!, typeColor: .allCases.randomElement()!, numberSymbol: .allCases.randomElement()!)
        }
    }
    
    @Published private var game = createSetGame()
    
    var cards: [Card] {
        game.cards
    }
    
    var score: Int {
        game.score
    }
    
    func createNewGame() {
        game.createNewGame()
    }
    
    func dealThreeCards() {
        game.dealThreeCards()
    }
    
    func choose(_ chosenCard: Card) {
        func compare(lhs: Symbol, rhs: Symbol) -> [String] {
           return []
        }
        
        
        game.choose(chosenCard) { (first, second, third)  in
            let result = (first.typeColor == second.typeColor
                          && second.typeColor == third.typeColor) || (first.color == second.color && second.color == third.color) || (first.numberSymbol == second.numberSymbol && second.numberSymbol == third.numberSymbol) || (first.symbol == second.symbol && second.symbol == third.symbol)
            return result
        }
    }
    
}
