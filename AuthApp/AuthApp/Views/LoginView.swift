//
//  LoginView.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var authVM: AuthViewModel
    @State private var showRegister = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Log-In")
                .padding()
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
                showRegister = true
            }
            
            if !authVM.errorMessage.isEmpty {
                Text(authVM.errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .fullScreenCover(isPresented: $showRegister) {
            RegisterView(authVM: authVM)
        }
    }
}
