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
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
            
        case 11 ... 20:
            return content
                .font(Font.body.weight(.regular))
                .foregroundColor(.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))
            
        case 21 ... 100:
            return content
                .font(Font.body.weight(.semibold))
                .foregroundColor(.purple)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.purple, lineWidth: 3))
            
        case 101 ... 1000:
            return content
                .font(Font.body.weight(.bold))
                .foregroundColor(.red)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 4))
            
        default:
            return content
                .font(Font.body.weight(.heavy))
                .foregroundColor(.black)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
        }
    }
}

extension View {
    func amountStyle(amount: Int) -> some View {
        self.modifier(AmountModifier(amount: amount))
    }
}
