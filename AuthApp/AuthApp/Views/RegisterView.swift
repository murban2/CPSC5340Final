//
//  RegisterView.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var authVM: AuthViewModel
    @State private var showLogin = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Register Account")
                .padding()
            TextField("Email", text: $authVM.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            SecureField("Password", text: $authVM.password)
                
            
            Button("Register") {
                authVM.register()
            }
            Button("Cancel") {
                showLogin = true
            }
            
            if !authVM.errorMessage.isEmpty {
                Text(authVM.errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .fullScreenCover(isPresented: $showLogin) {
            LoginView(authVM: authVM)
        }
    }
}
