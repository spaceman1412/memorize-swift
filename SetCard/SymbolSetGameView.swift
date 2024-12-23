//
//  ContentView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct SymbolSetGameView: View {
    @ObservedObject var symbolSetGame: SymbolSetGame
    
    private let size: CGFloat = 100
    private let aspectRatio: CGFloat = 3/2
    private let spacing: CGFloat = 4
    
    var body: some View {
        title
        
        AspectVGrid(symbolSetGame.cards, aspectRatio: aspectRatio) { card in
            
            let symbolCardView = SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: card.content.color, symbol: card.content.symbol, typeColor: card.content.typeColor, numberSymbol: card.content.numberSymbol))
            
            CardView(content:symbolCardView, color: .black, isSelected: card.isSelected, isMatched: card.isMatched)
                .padding(spacing)
                .onTapGesture {
                    symbolSetGame.choose(card)
                }
        }
        
        HStack {
            Button("New Game") {
                symbolSetGame.createNewGame()
            }
            
            Spacer()
            
            score
            
            Spacer()
            
            Button("Deal 3 More Cards") {
                symbolSetGame.dealThreeCards()
            }
            
        }.padding()
    }
    
    var score: some View {
        Text("Score: \(symbolSetGame.score)")
    }
    
    var title: some View {
        Text("Set Card Game")
            .font(.largeTitle)
    }
}

#Preview {
    SymbolSetGameView(symbolSetGame: SymbolSetGame())
}
