//
//  LoginView.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $authVM.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            SecureField("Password", text: $authVM.password)
                
            Button("Log In") {
                authVM.login()
            }
            Button("Register") {
                authVM.register()
            }
            
            if !authVM.errorMessage.isEmpty {
                Text(authVM.errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .fullScreenCover(isPresented: $authVM.isLoggedIn) {
            Text("Logged in Successfully")
        
        }
    }
}

