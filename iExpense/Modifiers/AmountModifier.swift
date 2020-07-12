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
        switch amount {
        case 0 ... 10:
            return content
                .font(Font.body.weight(.light))
                .foregroundColor(.gray)
            
        case 11 ... 20:
            return content
                .font(Font.body.weight(.regular))
                .foregroundColor(.black)
            
        case 21 ... 100:
            return content
                .font(Font.body.weight(.semibold))
                .foregroundColor(.purple)
            
        case 101 ... 1000:
            return content
                .font(Font.body.weight(.bold))
                .foregroundColor(.red)
            
        default:
            return content
                .font(Font.body.weight(.heavy))
                .foregroundColor(.black)
        }
    }
}

extension View {
    func amountStyle(amount: Int) -> some View {
        self.modifier(AmountModifier(amount: amount))
    }
}
