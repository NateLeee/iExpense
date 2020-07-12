//
//  ContentView.swift
//  iExpense
//
//  Created by Nate Lee on 7/12/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI


struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    
    var body: some View {
        VStack {
            Text("Hello \(name)")
            
            Button("Dismiss this sheet") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet = true
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Nate Lee")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
