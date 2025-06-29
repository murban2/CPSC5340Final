//
//  LogCaloriesView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI

struct LogCaloriesView: View {
    
    @ObservedObject var authVM: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
            Text("Log Calories")
                .padding()
            
            
            Button("Exit") {
                dismiss()
            }
        
            
    }
}


