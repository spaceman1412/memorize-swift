//
//  SymbolCardView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct SymbolCardView: View {
    var color: Color
    var symbol: Symbol
    var typeColor: ColorType
    var numberSymbol: SymbolNumber
    
    enum Symbol {
        case diamond
        case oval
        case squiggle
    }
    
    enum ColorType {
        case fill
        case stroke
        case stripped
    }
    
    enum SymbolNumber: Int {
        case one = 1
        case two = 2
        case three = 3
    }
    
    var body: some View {
        HStack {
            ForEach(0..<numberSymbol.rawValue, id: \.self) { _ in
                switch symbol {
                case .diamond:
                    diamond
                case .oval:
                    oval
                case .squiggle:
                    squiggle
                }
            }
        }
    }
    
    var oval: some View {
        switch typeColor {
        case .fill:
            AnyView(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(color)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        case .stroke:
            AnyView(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(lineWidth: Constants.lineWidth).foregroundStyle(color)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        case .stripped:
            AnyView(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(color).opacity(Constants.opacity)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        }
        
    }
    
    var diamond: some View {
        switch typeColor {
        case .fill:
            AnyView(Diamond().foregroundStyle(color))
        case .stroke:
            AnyView(Diamond().stroke(lineWidth: Constants.lineWidth).foregroundStyle(color))
        case .stripped:
            AnyView(Diamond().foregroundStyle(color).opacity(Constants.opacity))
        }
        
    }
    var squiggle: some View {
        switch typeColor {
        case .fill:
            AnyView(
                Rectangle().fill(color)
                    .aspectRatio(Constants.aspectRatio,contentMode: .fit)
            )
        case .stroke:
            AnyView(Rectangle().stroke(lineWidth: Constants.lineWidth).foregroundStyle(color)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        case .stripped:
            AnyView(Rectangle().fill(color).opacity(Constants.opacity)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        }
    }
   
    struct Constants {
        static let lineWidth: CGFloat = 4
        static let aspectRatio: CGFloat = 1.4/3
        static let opacity: CGFloat = 0.2
        static let cornerRadius: CGFloat = .infinity // Set up largest number for cornerRadius to stay the same with all size
    }
    
    struct Diamond: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
            return path
        }
    }
}

#Preview {
    SymbolCardView(color: .green, symbol: .oval, typeColor: .stroke, numberSymbol: .three)
}
