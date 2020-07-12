//
//  ContentView.swift
//  iExpense
//
//  Created by Nate Lee on 7/12/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            // Encode value first
            let jsonEncoder = JSONEncoder()
            let data = try? jsonEncoder.encode(items)
            
            // Save to UserDefaults
            UserDefaults.standard.set(data, forKey: "ExpensesData")
        }
    }
    
    init() {
        // Read from UserDefaults
        if let data = UserDefaults.standard.data(forKey: "ExpensesData") {
            let jsonDecoder = JSONDecoder()
            let decoded = try? jsonDecoder.decode([ExpenseItem].self, from: data)
            items = decoded ?? [ExpenseItem]()
            
        } else {
            // Otherwise, init an empty array
            items = [ExpenseItem]()
        }
    }
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(item.type)")
                                .font(.subheadline)
                            
                            Text("\(item.name)")
                                .font(.headline)
                        }
                        
                        Spacer()
                        
                        Text("\(item.amount)")
                            .amountStyle()
                    }
                    
                    
                }
                .onDelete { (indexSet) in
                    self.expenses.items.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: expenses.items.count > 0 ? EditButton() : nil, trailing:
                Button(action: {
                    // Show Add Expense Sheet
                    self.showingSheet.toggle()
                    
                }) {
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showingSheet) {
                    AddExpenseView(expenses: self.expenses)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
