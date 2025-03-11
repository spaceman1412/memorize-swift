//
//  ThemeStore.swift
//  Memorize
//
//  Created by H470-088 on 6/3/25.
//

import Foundation

extension UserDefaults {
    func themes(_ key: String) -> [Theme] {
        if let jsonData = data(forKey: key), let decodedData = try? JSONDecoder().decode([Theme].self, from: jsonData) {
             return decodedData
        } else {
            return []
        }
    }
    
    func set(_ data: [Theme],forKey key: String) {
        let data = try? JSONEncoder().encode(data)
        UserDefaults.standard.set(data, forKey:key)
    }
}

class ThemeStore: ObservableObject, Identifiable {
    private var name: String
    //Half viewmodel and model
    var themes: [Theme] {
        get {
            UserDefaults.standard.themes("Themes")
        }
        set {
            UserDefaults.standard.set(newValue,forKey: "Themes")
            objectWillChange.send()
        }
    }
    
    init(named name: String) {
        self.name = name
    }

    
    @Published private var _cursorIndex = 0
    
    var cursorIndex: Int {
        get { boundsCheckedPaletteIndex(_cursorIndex) }
        set {
            _cursorIndex = boundsCheckedPaletteIndex(newValue)
        }
    }
    
    private func boundsCheckedPaletteIndex(_ index: Int) -> Int {
        var index = index % themes.count
        
        if index < 0 {
            index += themes.count
        }
        
        return index
    }

    func insert(_ theme: Theme) {
        themes.append(theme)
    }
    
    func move() {
        
    }
    
    
    func delete(at index: Int) {
        themes.remove(at: index)
    }
    
}
