//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by H470-088 on 12/11/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private(set) var theme: Theme
    
    enum ColorGradient: ShapeStyle {
        case color(Color)
        case gradient(Gradient)
        
        var value: some ShapeStyle {
            switch self {
            case .color(let view):
                AnyShapeStyle(view)
            case .gradient(let view):
                AnyShapeStyle(view)
            }
        }
    }
    
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairs: theme.numberOfPairs) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                // Shuffle for not have dead emojis
                return theme.emojis.shuffled()[pairIndex]
            } else {
                return "🙏"
            }
        }
    }
    
    @Published private var game: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    var score: Int {
        return game.score
    }
    
    init(theme: Theme) {
        self.theme = theme
        game = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }

    //MARK: - Intents
    
    func createNewGame() {
        game = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }
    
    func shuffle() {
        game.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        game.choose(card)
    }
}
