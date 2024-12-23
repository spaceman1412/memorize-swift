//
//  SymbolCardView.swift
//  SetCard
//
//  Created by H470-088 on 2/12/24.
//

import SwiftUI

struct SymbolCardView: View {
    typealias SymbolSet = SymbolSetGame.Symbol
    
    var symbolSet: SymbolSet
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                ForEach(0..<symbolSet.numberSymbol.rawValue, id: \.self) { _ in
                    switch symbolSet.symbol {
                    case .diamond:
                        // Size responsive for the same size with all amount
                        diamond.aspectRatio(1/3,contentMode: .fit)
                    case .oval:
                        oval
                    case .squiggle:
                        squiggle
                    }
                }
            }.padding(10).frame(maxWidth: .infinity,maxHeight: .infinity)
        }
    }
    
    var oval: some View {
        switch symbolSet.typeColor {
        case .fill:
            AnyView(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(symbolSet.color.mainColor)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        case .stroke:
            AnyView(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(lineWidth: Constants.lineWidth).foregroundStyle(symbolSet.color.mainColor)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit)
            )
        case .stripped:
            AnyView(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(symbolSet.color.mainColor).opacity(Constants.opacity)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit)
            )
        }
    }
    
    var diamond: some View {
        switch symbolSet.typeColor {
        case .fill:
            AnyView(Diamond().foregroundStyle(symbolSet.color.mainColor))
        case .stroke:
            AnyView(Diamond().stroke(lineWidth: Constants.lineWidth).foregroundStyle(symbolSet.color.mainColor))
        case .stripped:
            AnyView(Diamond().foregroundStyle(symbolSet.color.mainColor).opacity(Constants.opacity))
        }
    }
    var squiggle: some View {
        switch symbolSet.typeColor {
        case .fill:
            AnyView(
                Rectangle().fill(symbolSet.color.mainColor)
                    .aspectRatio(Constants.aspectRatio,contentMode: .fit)
            )
        case .stroke:
            AnyView(Rectangle().stroke(lineWidth: Constants.lineWidth).foregroundStyle(symbolSet.color.mainColor)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        case .stripped:
            AnyView(Rectangle().fill(symbolSet.color.mainColor).opacity(Constants.opacity)
                .aspectRatio(Constants.aspectRatio,contentMode: .fit))
        }
    }
    
    struct Constants {
        static let lineWidth: CGFloat = 4
        static let aspectRatio: CGFloat = 1.4/3
        static let opacity: CGFloat = 0.2
        static let padding: CGFloat = 5
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
    SymbolCardView(symbolSet: SymbolSetGame.Symbol(color: SymbolSetGame.Symbol.SymbolColor.allCases.randomElement()!, symbol: .squiggle, typeColor: .stroke, numberSymbol: .three))
        .border(.black)
        .aspectRatio(3/2,contentMode: .fit)
        .frame(width: 100)
}
