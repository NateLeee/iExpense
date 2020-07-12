//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Nate Lee on 7/12/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject var expenses: Expenses
    
    @State private var name: String = ""
    @State private var expenseType = "Personal"
    @State private var amount = ""
    
    var expenseTypes = ["Personal", "Business", "Other"] // Pay attention! private isn't allowed here!
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker(selection: $expenseType, label: Text("Expense Type")) {
                    ForEach(expenseTypes, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
            }
            .navigationBarTitle("Add Expense")
            .navigationBarItems(
                leading: Button(action: dismissSheet, label: {
                    Image(systemName: "xmark")}
                ),
                trailing: Button(action: {
                    // DONE: - Actually save this!
                    guard self.name != "", Int(self.amount) != nil else {
                        return
                    }
                    
                    self.expenses.items.append(ExpenseItem(name: self.name, type: self.expenseType, amount: Int(self.amount) ?? 0))
                    
                    // Dismiss the sheet finally...
                    self.dismissSheet()
                    
                }, label: {
                    Text("Save")
                }))
        }
    }
    
    private func dismissSheet() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
