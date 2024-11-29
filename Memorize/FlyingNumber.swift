//
//  FlyingNumber.swift
//  Memorize
//
//  Created by H470-088 on 29/11/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
