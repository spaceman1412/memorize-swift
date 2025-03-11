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
                        VStack(alignment: .leading) {
                            Text(theme.name).foregroundStyle(Color(rgba: theme.color))
                            Text(theme.emojis.joined())
                            Text("\(theme.numberOfPairs) pairs").font(.system(size: 10)).foregroundStyle(.gray)
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role:.destructive) {
                            if let index = store.themes.firstIndex(where: {$0.id == theme.id }) {
                                store.delete(at: index)
                            }
                        } label: {
                            Label("Remove", systemImage: "trash.slash")
                        }
                        Button {
                            if let index = store.themes.firstIndex(where: {$0.id == theme.id }) {
                                store.cursorIndex = index
                                showEditor = true
                            }
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.blue)
                    }
                }
            }
            .navigationTitle("Themes")
            .navigationDestination(for: Theme.ID.self) { id in
                
            }
            .sheet(isPresented: $showEditor) {
                // So with this navigationDestination even though the condition is not trigger yet it still executed the code which is annoying
                if showEditor == true {
                    ThemeEditor(withTheme: $store.themes[store.cursorIndex])
                }
            }
            .toolbar {
                Button {
                    store.insert(Theme(name: "New", emojis: ["🌈", "☀️", "🌧", "🌩", "❄️"], numberOfPairs: 0, color: RGBA(color: .black)))
                    store.cursorIndex = store.themes.count - 1
                    showEditor = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

