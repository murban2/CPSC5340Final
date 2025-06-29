//
//  LogCaloriesView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI

struct LogCaloriesView: View {
    
    @ObservedObject var authVM: AuthViewModel
    @State private var calorieInput : Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            Text("Log Calories")
                .padding()
                .fontWeight(.bold)
            
            Text("Current Calories: \(loadTodaysCalories(filename: "Calorie_\(authVM.uid ?? "unknown").json"))")
                .padding()
            TextField("Enter calories", text: Binding(
                get: { String(format: "%.2f", calorieInput) },
                set: { newValue in
                    if let value = Double(newValue) {
                        calorieInput = value
                    }
                }
            ))
                .padding()
                .border(.gray)
            Button("Add") {
                addOrUpdateCalorieEntry(filename: "Calorie_\(authVM.uid ?? "unknown").json", newTotal: calorieInput)
                dismiss()
            }
            .padding()
            
            Button("Subtract") {
                addOrUpdateCalorieEntry(filename: "Calorie_\(authVM.uid ?? "unknown").json", newTotal: -calorieInput)
                dismiss()
            }
            .padding()
        }
           
        
            
    }
}


