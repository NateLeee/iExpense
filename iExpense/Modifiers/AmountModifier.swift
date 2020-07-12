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
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func amountStyle(amount: Int) -> some View {
        self.modifier(AmountModifier(amount: amount))
    }
}
