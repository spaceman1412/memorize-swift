//
//  ContentView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct SymbolSetGameView: View {
    var symbolSetGame = SymbolSetGame()
    
    var body: some View {
        title
        
        ForEach(symbolSetGame.cards) {
            card in
            CardView(content:SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: .green, symbol: .oval, typeColor: .fill, numberSymbol: .three)), color: .black, isSelected: true, isMatched: false)
                .frame(width: 100, height: 100)
        }
    }
    
    var title: some View {
        Text("Set Card Game")
    }
}

#Preview {
    SymbolSetGameView()
}
