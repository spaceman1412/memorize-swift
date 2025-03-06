//
//  Theme.swift
//  Memorize
//
//  Created by H470-088 on 6/3/25.
//

import Foundation


struct Theme: Identifiable, Hashable, Codable {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let color: String
    
    
    var id = UUID()
    
    static let builtin: [Theme] = [
        Theme(name: "Rainbow", emojis: ["🌈", "☀️", "🌧", "🌩", "❄️"], numberOfPairs: Int.random(in: 0..<10), color: "Multiple"),
        Theme(name: "Fire", emojis: ["🔥", "🌋", "☄️", "💥", "🕯"], numberOfPairs: Int.random(in: 0..<10), color: "Red"),
        Theme(name: "Ocean", emojis: ["🌊", "🐚", "🐠", "🐳", "🦀"], numberOfPairs: Int.random(in: 0..<10), color: "Blue"),
        Theme(name: "Night Sky", emojis: ["🌟", "🌙", "✨", "🌌", "🪐"], numberOfPairs: Int.random(in: 0..<10), color: "Yellow"),
        Theme(name: "Nature", emojis: ["🍀", "🌿", "🌳", "🍂", "🌻"], numberOfPairs: Int.random(in: 0..<10), color: "Green"),
        Theme(name: "Art", emojis: ["🎨", "🖌", "🖼", "🎭", "✏️"], numberOfPairs: Int.random(in: 0..<10), color: "Pink")
    ]

}
