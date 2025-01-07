//
//  ContentView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct SymbolSetGameView: View {
    @ObservedObject var symbolSetGame: SymbolSetGame
    typealias Card = SetGame<SymbolSetGame.Symbol>.Card

    private let size: CGFloat = 100
    private let aspectRatio: CGFloat = 3/2
    private let spacing: CGFloat = 4
    @State private var dealt = Set<Card.ID>()
    private let deckSize: CGFloat = 100
    
    private func isDiscard(_ card: Card) -> Bool {
        card.isMatched
    }
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var discardCards: [Card] {
        symbolSetGame.cards.filter { card in
            !isDiscard(card)
        }
    }
    
    private func deal() {
        for card in symbolSetGame.cards {
            dealt.insert(card.id)
        }
    }


    var body: some View {
        title
        
        AspectVGrid(symbolSetGame.cards, aspectRatio: aspectRatio) { card in
            
            if isDealt(card) {
                let symbolCardView = SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: card.content.color, symbol: card.content.symbol, typeColor: card.content.typeColor, numberSymbol: card.content.numberSymbol))
                
                CardView(content:symbolCardView, color: .black, isSelected: card.isSelected, isMatched: card.isMatched)
                    .padding(spacing)
                    .onTapGesture {
                        symbolSetGame.choose(card)
                    }
            }
        }
        
        HStack {
            Button("New Game") {
                symbolSetGame.createNewGame()
            }
            
            Spacer()

            CardView(content:Text(""), color: .black, isSelected: false, isMatched: false)
                .padding(spacing)
                .frame(width: deckSize, height: deckSize/aspectRatio)
                .onTapGesture {
                    deal()
                }

            Spacer()
            
            score
            
            
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
