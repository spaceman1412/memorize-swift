//
//  MemorizeApp.swift
//  Memorize
//
//  Created by H470-088 on 22/8/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
//    @StateObject var game = EmojiMemoryGame()
    @StateObject private var store = ThemeStore(named: "Main")
    
    var body: some Scene {
        WindowGroup {
            ThemeChooser()
            //            EmojiMemoryGameView(viewModel: game)
        }
        .environmentObject(store)
    }
}
