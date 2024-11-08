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
            let emojis = ["👻","👿","👽","🤖","🤖"]
            
            ForEach(emojis.indices,id:\.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
            
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        Group {
            if isFaceUp {
                ZStack {
                        base.foregroundStyle(.white)
                    
                        base.strokeBorder(lineWidth: 6)
                    Text(content).font(.largeTitle)
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
