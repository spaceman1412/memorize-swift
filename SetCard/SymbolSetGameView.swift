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
    private let deckSize: CGFloat = 100
    private let dealtAnimation: Animation = .easeInOut(duration: 1)
    private let dealtInterval: TimeInterval = 0.1

    @State private var dealt = Set<Card.ID>()
    

    private func isDiscard(_ card: Card) -> Bool {
        discardCards.contains(card)
    }
    
    private var undealtCards: [Card] {
        symbolSetGame.cards.filter { card in
            !isDealt(card)
        }
    }
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var discardCards: [Card] {
        symbolSetGame.cards.filter { card in
            card.isMatched
        }
    }
    
    
    
    
    private func deal() {
        var delay: TimeInterval = 0

        if dealt.count > 0 {
            // Add to dealt stack
            let lastIndex = symbolSetGame.cards.count - 1
            let threeLastCards = [symbolSetGame.cards[lastIndex - 2], symbolSetGame.cards[lastIndex - 1], symbolSetGame.cards[lastIndex]]
            
            for card in threeLastCards {
                _ = withAnimation(dealtAnimation.delay(delay)) {
                    dealt.insert(card.id)
                }
                delay += dealtInterval
            }
            
            symbolSetGame.dealThreeCards()
        } else {
            for card in symbolSetGame.cards {
                _ = withAnimation(dealtAnimation.delay(delay)) {
                    dealt.insert(card.id)
                }
                
                delay += dealtInterval
            }
            
            symbolSetGame.dealThreeCards()
        }
    }
    
    @Namespace private var dealingNamespace
    
    var cards: some View {
        AspectVGrid(symbolSetGame.cards, aspectRatio: aspectRatio) { card in
            if isDealt(card) && !isDiscard(card) {
                let symbolCardView = SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: card.content.color, symbol: card.content.symbol, typeColor: card.content.typeColor, numberSymbol: card.content.numberSymbol))
                
                CardView(content:symbolCardView, color: .black, isSelected: card.isSelected, isMatched: card.isMatched)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
                    .padding(spacing)
                    .onTapGesture {
                        withAnimation {
                            symbolSetGame.choose(card)
                        }
                    }
            }
        }
    }


    var body: some View {
        title
        VStack {
            
            cards
            
            
            discardPile
            
            HStack {
                //TODO: The current new game is not working correct
                Button("New Game") {
                    symbolSetGame.createNewGame()
                }
                
                Spacer()
                
                deck

                Spacer()
                
                score
            }
        }.padding()
    }
    

    
    var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                let symbolCardView = SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: card.content.color, symbol: card.content.symbol, typeColor: card.content.typeColor, numberSymbol: card.content.numberSymbol))
                
                CardView(content:symbolCardView, color: .black, isSelected: card.isSelected, isMatched: card.isMatched)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
            }
        }
        .frame(width: deckSize, height: deckSize / aspectRatio)
        .onTapGesture {
            deal()
        }
    }
    
    var discardPile: some View {
        HStack {
            Spacer()
            ZStack {
                ForEach(discardCards.reversed()) { card in
                    let symbolCardView = SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: card.content.color, symbol: card.content.symbol, typeColor: card.content.typeColor, numberSymbol: card.content.numberSymbol))
                    
                    CardView(content:symbolCardView, color: .black, isSelected: true, isMatched: true)
                        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                        .transition(.asymmetric(insertion: .identity, removal: .identity))
                }
            }
            .frame(width: deckSize / 2, height: deckSize / 2 / aspectRatio)
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
