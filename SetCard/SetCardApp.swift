//
//  SetCardApp.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

@main
struct SetCardApp: App {
    @StateObject var symbolSetGame = SymbolSetGame()
    
    var body: some Scene {
        WindowGroup {
            SymbolSetGameView(symbolSetGame: symbolSetGame)
        }
    }
}
