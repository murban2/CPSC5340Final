//
//  LogWorkoutView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI

struct LogWorkoutView: View {
    
    @ObservedObject var authVM: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var exerciseList: [String] = []
    
    @State private var selectedExercise: String = ""
    @State private var sets: String = ""
    @State private var weight: String = ""
    @State private var reps: String = ""
    
    var body: some View {
        VStack {
            Text("Log Workout")
                .padding()
                .fontWeight(.bold)
            
            
            Picker("Select Exercise", selection: $selectedExercise) {
                ForEach(exerciseList, id: \.self) { exercise in
                    Text(exercise)
                }
            }
            .pickerStyle(.wheel)
            .padding()
            .foregroundStyle(.black)
            
            TextField("Number of Sets", text: $sets)
                .padding()
                .border(.gray)
            TextField("Average Weight", text: $weight)
                .padding()
                .border(.gray)
            TextField("Average Reps", text: $reps)
                .padding()
                .border(.gray)
            
            
            Button("Submit") {
                if sets != "" && weight != "" && reps != "" {
                    let model = WorkoutModel(sets: Int(sets) ?? 0, weight: Double(weight) ?? 0, reps: Double(reps) ?? 0, exercise: selectedExercise)
                    addOrUpdateWorkoutEntry(filename: "Workout_\(authVM.uid ?? "unknown").json", model: model)
                }
                
                dismiss()
            }
        }
        .onAppear {
            exerciseList = loadExerciseList(filename: "Exercise_\(authVM.uid ?? "unknown").json")
            
            if let first = exerciseList.first {
                selectedExercise = first
            }
        }
    }
}

