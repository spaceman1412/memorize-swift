//
//  Cardify.swift
//  Memorize
//
//  Created by H470-088 on 25/11/24.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var rotation: Double
    
    var animatableData: Double {
        get {return rotation}
        set {rotation = newValue}
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        ZStack {
            
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            .degrees(rotation),
            axis: (0,1,0)
        )
        
    }
    
    private struct Constants {
        static let cornerRadius:CGFloat = 12
        static let lineWidth:CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
