//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by H470-088 on 22/8/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    var emojis: [String] = ["🎃", "👻", "🕷️", "💀","🎃", "👻", "🕷️", "💀"]
    
    var body: some View {
        title
        ScrollView {
            cards
        }
        Spacer()
    }
    
    
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(emojis.indices,id:\.self) { index in
                CardView(content: emojis[index], isFaceUp: true).aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    } }




#Preview {
    EmojiMemoryGameView()
}
