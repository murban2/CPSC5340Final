//
//  CreateExerciseView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI

struct CreateExerciseView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var authVM: AuthViewModel
    @State private var exercise: String = ""
    
    var body: some View {
        VStack {
            Text("Create Exercise")
                .padding()
                .fontWeight(.bold)
            
            
            TextField("Enter an Exercise", text: $exercise)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Submit") {
                addExercise(filename: "Exercise_\(authVM.uid ?? "unknown").json", newExercise: exercise)
                dismiss()
            }
            
        }
    }
}
