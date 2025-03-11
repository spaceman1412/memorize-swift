//
//  Theme.swift
//  Memorize
//
//  Created by H470-088 on 6/3/25.
//

import Foundation
import SwiftUI

struct RGBA: Codable, Equatable, Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}
extension Color {
    init(rgba: RGBA) {
        self.init(.sRGB, red: rgba.red, green: rgba.green, blue: rgba.blue, opacity: rgba.alpha)
    }
}
extension RGBA {
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        UIColor(color).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }
}

struct Theme: Identifiable, Hashable, Codable {
    var name: String
    var emojis: [String]
    var numberOfPairs: Int
    var color: RGBA
    
    var id = UUID()
    
//    static let builtin: [Theme] = [
//        Theme(name: "Rainbow", emojis: ["🌈", "☀️", "🌧", "🌩", "❄️"], numberOfPairs: Int.random(in: 0..<10), color: "Multiple"),
//        Theme(name: "Fire", emojis: ["🔥", "🌋", "☄️", "💥", "🕯"], numberOfPairs: Int.random(in: 0..<10), color: "Red"),
//        Theme(name: "Ocean", emojis: ["🌊", "🐚", "🐠", "🐳", "🦀"], numberOfPairs: Int.random(in: 0..<10), color: "Blue"),
//        Theme(name: "Night Sky", emojis: ["🌟", "🌙", "✨", "🌌", "🪐"], numberOfPairs: Int.random(in: 0..<10), color: "Yellow"),
//        Theme(name: "Nature", emojis: ["🍀", "🌿", "🌳", "🍂", "🌻"], numberOfPairs: Int.random(in: 0..<10), color: "Green"),
//        Theme(name: "Art", emojis: ["🎨", "🖌", "🖼", "🎭", "✏️"], numberOfPairs: Int.random(in: 0..<10), color: "Pink")
//    ]

}
