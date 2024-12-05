//
//  SymbolSetGame.swift
//  SetCard
//
//  Created by H470-088 on 3/12/24.
//

import SwiftUI


struct SymbolSetGame {
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
    
    var game: SetGame = createSetGame()
    
    static func createSetGame() -> SetGame<Symbol> {
        SetGame(numberOfCards: 4) {
            Symbol(color: .allCases.randomElement()!, symbol: .allCases.randomElement()!, typeColor: .allCases.randomElement()!, numberSymbol: .allCases.randomElement()!)
        }
    }
    
    var cards: [Card] {
        game.cards
    }
    
}
