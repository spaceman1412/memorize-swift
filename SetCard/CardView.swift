//
//  CardView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct CardView<Content: View>: View {
    var content: Content
    var color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .aspectRatio(3/2, contentMode: .fit)
                .opacity(isSelected || isMatched ? 0 : 1)
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(style: StrokeStyle(lineWidth: 1))
                .aspectRatio(3/2,contentMode: .fit)
                .foregroundStyle(color)
                .overlay(contentView)
                .opacity(isSelected || isMatched ? 1 : 0)
        }.opacity(isMatched ? 0 : 1)
    }
    
    var contentView: some View {
        content
    }
}

#Preview {
    VStack {
        CardView(content:SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: .green, symbol: .oval, typeColor: .stroke, numberSymbol: .three)), color: .black, isSelected: true, isMatched: false)
            .frame(width: 100, height: 100)
        CardView(content:Rectangle(), color: .blue, isSelected: false, isMatched: false)
            .frame(width: 100, height: 100)
    }
    .padding(50)
}
