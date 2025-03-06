//
//  ThemeChooser.swift
//  Memorize
//
//  Created by H470-088 on 27/2/25.
//

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var store: ThemeStore
    
    @State private var showEditor = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.themes) { theme in
                    NavigationLink(value: theme.id) {
                        Text(theme.name)
                    }
                }
            }
            .navigationTitle("Themes")
            .navigationDestination(for: Theme.self) { theme in
                if let index = store.themes.firstIndex(where: {$0.id == theme.id }) {
                    ThemeEditor(theme: $store.themes[index])
                }
            }
            .navigationDestination(isPresented: $showEditor) {
                // So with this navigationDestination even though the condition is not trigger yet it still executed the code which is annoying
                if showEditor == true {
                    ThemeEditor(theme: $store.themes[store.themes.count - 1])
                }
            }
            .toolbar {
                Button {
                    store.insert(Theme(name: "New", emojis: [], numberOfPairs: 0, color: "black"))
                    showEditor = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

