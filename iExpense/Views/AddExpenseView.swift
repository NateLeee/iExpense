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
    
    @State private var name: String = ""
    @State private var expenseType = "Personal"
    @State private var amount = ""
    
    private var expenseTypes = ["Personal", "Business", "Other"]
    
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
                leading: Button(action: {
                    // Dismiss this sheet
                    self.presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Image(systemName: "xmark")}
                ),
                trailing: Button(action: {
                    // TODO: - Actually save this!
                    
                    
                }, label: {
                    Text("Save")
                }))
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
