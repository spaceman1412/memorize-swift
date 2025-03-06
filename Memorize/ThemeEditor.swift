//
//  ThemeEditor.swift
//  Memorize
//
//  Created by H470-088 on 6/3/25.
//

import SwiftUI

struct ThemeEditor: View {
    @Binding var theme: Theme
    
    var body: some View {
        Text(theme.name)
    }
}

