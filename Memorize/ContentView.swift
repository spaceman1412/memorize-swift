//
//  ContentView.swift
//  Memorize
//
//  Created by H470-088 on 22/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(lineWidth: 6)
                Text("👻").font(.largeTitle)
            }
        }
        else {
            RoundedRectangle(cornerRadius: 10)
        }
    } }




#Preview {
    ContentView()
}
