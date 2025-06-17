//
//  ContentView.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        if authVM.isLoggedIn {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("You are logged in")
            }
            .padding()
        }
    }
}
