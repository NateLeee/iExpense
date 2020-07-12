//
//  ContentView.swift
//  iExpense
//
//  Created by Nate Lee on 7/12/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Nate", lastName: "Lee")
    
    var body: some View {
        VStack {
            Text("\(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
            
            Button("Serialize") {
                let encoder = JSONEncoder()
                do {
                    let encoded = try encoder.encode(self.user)
                    UserDefaults.standard.set(encoded, forKey: "User")
                } catch {
                    fatalError("JSONEncoder failed to encode User()!")
                }
            }
        }
        .onAppear {
            if let userData = UserDefaults.standard.data(forKey: "User") {
                let decoder = JSONDecoder()
                do {
                    self.user = try decoder.decode(User.self, from: userData)
                } catch {
                    fatalError("JSONDecoder failed to decode userData!")
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
