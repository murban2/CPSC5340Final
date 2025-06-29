//
//  AuthViewModel.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import Foundation
import FirebaseAuth

class AuthViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    
    
    var uid: String? {
            return Auth.auth().currentUser?.uid
    }
    
    func login() {
        errorMessage = ""
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.isLoggedIn = true
                }
            }
        }
    }
    
    
    func register() {
        errorMessage = ""
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.isLoggedIn = true
                }
            }
        }
    }
}
