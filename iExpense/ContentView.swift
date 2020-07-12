//
//  ContentView.swift
//  iExpense
//
//  Created by Nate Lee on 7/12/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text("\(item.name) \(item.type) \(item.amount)")
                }
                .onDelete { (indexSet) in
                    self.expenses.items.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing:
                Button(action: {
                    self.expenses.items.append(ExpenseItem(name: "Test", type: "Personal", amount: 9))
                }) {
                    Image(systemName: "plus")
                }
            )
                
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
