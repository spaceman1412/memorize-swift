//
//  ContentView.swift
//  Memorize
//
//  Created by H470-088 on 22/8/24.
//

import SwiftUI

struct Theme {
    let emojis: [String]
    let name: String
    let imageName: String
}

struct ContentView: View {
    @State var cardCount: Int = 0
    let halloweenTheme = Theme(emojis: ["🎃", "👻", "🕷️", "💀","🎃", "👻", "🕷️", "💀"], name: "Halloween", imageName: "party.popper")
    let vehicleTheme = Theme(emojis: ["🚗", "🚌", "🚓", "🚑","🚗", "🚌", "🚓", "🚑"], name: "Vehicles",imageName: "car.fill" )
    let animalTheme = Theme(emojis: ["🐶", "🐱", "🐰", "🐼","🐶", "🐱", "🐰", "🐼"], name: "Animals", imageName: "lizard")
    @State var emojis: [String]
    let themes: [Theme]
    
    init() {
        themes = [halloweenTheme, vehicleTheme, animalTheme]
        emojis = halloweenTheme.emojis.shuffled()
    }
    
    var body: some View {
        title
        ScrollView {
            cards
        }
        Spacer()
        themeSwitcher
    }
    
    var themeSwitcher: some View {
        HStack(alignment: .bottom, spacing: 50) {
            ForEach(themes.indices,id: \.self) { index in
                themeButton(name: themes[index].name, imageName: themes[index].imageName)
            }
        }
    }
    
    func themeButton(name: String, imageName: String) -> some View {
        Button(action: {
            switch(name) {
            case halloweenTheme.name:
                emojis = halloweenTheme.emojis.shuffled()
            case vehicleTheme.name:
                emojis = vehicleTheme.emojis.shuffled()
            case animalTheme.name:
                emojis = animalTheme.emojis.shuffled()
            default:
                break
            }
            
        }, label: {
            VStack {
                Image(systemName: imageName).imageScale(.large).font(.title)
                Text(name)
            }
        })
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(emojis.indices,id:\.self) { index in
                CardView(content: emojis[index]).aspectRatio(2/3,contentMode: .fit)
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
    ContentView()
}
