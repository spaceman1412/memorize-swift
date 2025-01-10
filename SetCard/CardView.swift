//
//  CardView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct CardView<Content: View>: View ,Animatable {
    var content: Content
    var color: Color
    private var rotation: Double
    var isSelected: Bool {
        rotation < 90
    }
    var isMatched: Bool = false
    
    var animatableData: Double {
        get {return rotation}
        set {rotation = newValue}
    }
    
    init(content: Content, color: Color, isSelected: Bool, isMatched: Bool) {
        self.content = content
        self.color = color
        self.isMatched = isMatched
        rotation = isSelected ? 0 : 180
    }
    
    var body: some View {
        if (isSelected || !isMatched) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(color)
                        .opacity(isSelected ? 0 : 1)
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1))
                        .background(.white)
                        .overlay(contentView)
                        .opacity(isSelected  ? 1 : 0)
                }
                .rotation3DEffect(
                    .degrees(rotation),
                    axis: (0, 1 ,0)
                )
            
        } else {
            Color.clear
        }
    }
    
    var contentView: some View {
        content
    }
}

#Preview {
        var selected = false
    return CardView(content:SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: .green, symbol: .oval, typeColor: .stroke, numberSymbol: .three)), color: .green, isSelected: selected, isMatched: false).aspectRatio(3/2,contentMode: .fit)
          
}
