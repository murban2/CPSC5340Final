//
//  ViewDataView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI

struct ViewDataView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var calories: String = "No Entry"
    @State private var weight: String = "No Entry"
    @State private var todaysWorkouts: [String: WorkoutModel] = [:]
    
    
    
    var body: some View {
        VStack {
            Text("Todays Data")
                .padding()
                .fontWeight(.bold)
            Text("Weight: \(weight)")
                .padding()
            Text("Calories: \(calories)")
                .padding()
            
            List {
                ForEach (todaysWorkouts.keys.sorted(), id: \.self) { exercise in
                    if let workout = todaysWorkouts[exercise] {
                        VStack {
                            Text(exercise)
                                .fontWeight(.bold)
                            Text("Sets:       \(String(workout.sets))")
                            Text("Avg Weight: \(String(format: "%.2f", workout.weight))")
                            Text("Avg Reps:   \(String(format: "%.2f", workout.reps))")
                        }
                    }
                }
            }
            
            
        }
        .onAppear {
            calories = String(loadTodaysCalories(filename: "Calorie_\(authVM.uid ?? "unknown").json"))
            weight = String(loadTodaysWeight(filename: "Weight_\(authVM.uid ?? "unknown").json"))
            todaysWorkouts = loadTodaysWorkout(filename: "Workout_\(authVM.uid ?? "unknown").json")
        }
        
    }
        
}


