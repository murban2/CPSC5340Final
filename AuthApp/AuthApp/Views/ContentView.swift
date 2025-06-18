//
//  ContentView.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        if authVM.isLoggedIn {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("You are logged in")
                Button("Logout") {
                    logout()
                }
                .padding()
            }
            .padding()
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            authVM.isLoggedIn = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
