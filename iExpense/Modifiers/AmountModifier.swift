//
//  AmountModifier.swift
//  iExpense
//
//  Created by Nate Lee on 7/12/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation
import SwiftUI

struct AmountModifier: ViewModifier {
    var amount: Int
    
    func body(content: Content) -> some View {
        content
            .font(determineFont())
            .foregroundColor(determineColor())
    }
    
    private func determineColor() -> Color {
        switch amount {
        case 0 ... 10:
            return Color.gray
        case 11 ... 20:
            return Color.black
        case 21 ... 100:
            return Color.purple
        case 101 ... 1000:
            return Color.red
        default:
            return Color.black
        }
    }
    
    private func determineFont() -> Font {
        switch amount {
        case 0 ... 10:
            return Font.body.weight(.light)
        case 11 ... 20:
            return Font.body.weight(.regular)
        case 21 ... 100:
            return Font.body.weight(.semibold)
        case 101 ... 1000:
            return Font.body.weight(.bold)
        default:
            return Font.body.weight(.heavy)
        }
    }
    
}

extension View {
    func amountStyle(amount: Int) -> some View {
        self.modifier(AmountModifier(amount: amount))
    }
}
