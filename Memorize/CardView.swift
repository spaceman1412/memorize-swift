//
//  CardView.swift
//  Memorize
//
//  Created by H470-088 on 25/11/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    private let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        
        Pie(endAngle: Angle.degrees(300))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content).font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1,contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let inset:CGFloat = 5
        
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 5
        }
    }
}

#Preview {
    typealias Card = CardView.Card
    
    
    return VStack {
        HStack {
            CardView(Card(isFaceUp: true,content: "X", id: "card1"))
                .aspectRatio(4/3,contentMode: .fit)
            CardView(Card(content: "X", id: "card1"))
        }
        
        HStack {
            CardView(Card(isFaceUp: true,isMatched: true,content: "This is a very long string i and i hope it fit", id: "card1"))
            CardView(Card(isMatched: true,content: "X", id: "card1"))
        }
    }
    .padding()
    .foregroundStyle(.green)
    
    
}
