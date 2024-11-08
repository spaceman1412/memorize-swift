//
//  ContentView.swift
//  Memorize
//
//  Created by H470-088 on 22/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount: Int = 0
    let emojis = ["👻","👿","👽","🤖","🎃","👾","😼"]
    
    var body: some View {
        Group {
            ScrollView {
                cards
            }
            Spacer()
            cardCounterAdjuster
        }
    }
    
    var cardCounterAdjuster: some View {
        HStack {
            cardCounterAdjustButton(by: +1, systemImage: "rectangle.stack.badge.plus.fill")
            Spacer()
            cardCounterAdjustButton(by: -1, systemImage: "rectangle.stack.badge.minus.fill")
        }.padding()
            .font(.largeTitle)
            .imageScale(.large)
        
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount,id:\.self) { index in
                CardView(content: emojis[index], isFaceUp: true).aspectRatio(2/3,contentMode: .fit)
            }
            
        }
        .foregroundStyle(.orange)
        .padding()
    }
    func cardCounterAdjustButton(by offset: Int,systemImage: String) -> some View {
        Button(action: {
            cardCount = cardCount + offset
        }, label: {
            Image(systemName: systemImage)
        }).disabled(cardCount + offset > emojis.count || cardCount + offset < 0)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 6)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    } }




#Preview {
    ContentView()
}
