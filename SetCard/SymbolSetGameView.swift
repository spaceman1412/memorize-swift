//
//  ContentView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct SymbolSetGameView: View {
    @State var symbolSetGame = SymbolSetGame()
    
    static private let size: CGFloat = 100
    
    var body: some View {
        title
        
        AspectVGrid(symbolSetGame.cards, aspectRatio: 1) { card in
            
           let symbolCardView = SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: card.content.color, symbol: card.content.symbol, typeColor: card.content.typeColor, numberSymbol: card.content.numberSymbol))
            
            CardView(content: symbolCardView, color: .black, isSelected: card.isSelected, isMatched: card.isMatched).frame(width: SymbolSetGameView.size, height: SymbolSetGameView.size)
                .onTapGesture {
                    symbolSetGame.choose(card)
                }
        }
        
        HStack {
            Button("New Game") {
                
            }
            
            Spacer()
            
            Button("Deal 3 More Cards") {
                
            }
        }.padding()
    }
    
    var title: some View {
        Text("Set Card Game")
            .font(.largeTitle)
    }
}

#Preview {
    SymbolSetGameView()
}
