//
//  ThemeEditor.swift
//  Memorize
//
//  Created by H470-088 on 6/3/25.
//

import SwiftUI

struct ThemeEditor: View {
    @Binding var theme: Theme
    @State private var emojisText: String = ""
    @State private var bgColor = Color(.black)
    @State private var numberOfPairs: Int = 0
    
    
    init(withTheme theme: Binding<Theme>) {
        // Doesn't understand this shit so please check it again
        self._theme = theme
        self._emojisText = .init(initialValue: self.theme.emojis.joined())
        self._bgColor = .init(initialValue: Color(rgba: self.theme.color))
    }
    
    var body: some View {
        Form {
            ColorPicker(selection: $bgColor) {
                TextField("Name",text: $theme.name)
            }.onChange(of: bgColor) {
                theme.color = RGBA(color: bgColor)
            }
            
            Section(header: Text("Emojis")) {
                TextField("Emojis",text: $emojisText)
                    .onChange(of: emojisText) {
                        // TODO: Need to add rule emoji only here
                        theme.emojis = emojisText.split(separator: "").map {String($0)}
                    }
            }
            
            Stepper(value: $numberOfPairs, in: 0...5) {
                Text("\(numberOfPairs) pairs")
            } .onChange(of: numberOfPairs) {
                theme.numberOfPairs = numberOfPairs
            }
        }
    }
}

