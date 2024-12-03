//
//  CardView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct CardView<Content: View>: View {
    var content: Content
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .strokeBorder(style: StrokeStyle(lineWidth: 1))
            .aspectRatio(2/3,contentMode: .fit)
            .foregroundStyle(color)
            .overlay(contentView)
    }
    
    var contentView: some View {
        content
            .scaleEffect(0.3)
    }
}




#Preview {
    VStack {
        CardView(content:Rectangle(), color: .red)
            .frame(width: 100, height: 100)
        CardView(content:Rectangle(), color: .blue)
            .frame(width: 100, height: 100)
    }
    .padding(50)
}
