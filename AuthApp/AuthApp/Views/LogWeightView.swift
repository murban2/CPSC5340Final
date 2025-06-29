//
//  LogWeightView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI

struct LogWeightView: View {
    
    @ObservedObject var authVM: AuthViewModel
    @State private var weightInput : Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Log Weight")
                .padding()
                .fontWeight(.bold)
            
            TextField("Enter weight", text: Binding(
                get: { String(format: "%.2f", weightInput) },
                set: { newValue in
                    if let value = Double(newValue) {
                        weightInput = value
                    }
                }
            ))
                .padding()
                .border(.gray)
            Button("Submit") {
                addOrUpdateWeightEntry(filename: "Weight_\(authVM.uid ?? "unknown").json", newWeight: weightInput)
                dismiss()
            }
            .padding()
            
           
        }
    }
}


