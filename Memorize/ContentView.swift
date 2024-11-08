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
    @State var isFaceUp: Bool
    
    var body: some View {
       var base = RoundedRectangle(cornerRadius: 12)
        
        
        Group {
            if isFaceUp {
                ZStack {
                        base.foregroundStyle(.white)
                    
                        base.strokeBorder(lineWidth: 6)
                    Text("👻").font(.largeTitle)
                }
            }
            else {
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    } }




#Preview {
    ContentView()
}
