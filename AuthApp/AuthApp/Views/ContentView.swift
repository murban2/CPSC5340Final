//
//  ContentView.swift
//  AuthApp
//
//  Created by user276433 on 6/17/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        if authVM.isLoggedIn {
            NavigationStack {
                List {
                    NavigationLink(destination: ViewDataView(authVM: authVM)) {
                        Text("View Todays Data")
                    }
                    NavigationLink(destination: CreateExerciseView(authVM: authVM)) {
                        Text("Create Exercise")
                    }
                    NavigationLink(destination: LogWorkoutView(authVM: authVM)) {
                        Text("Log Workout")
                    }
                    NavigationLink(destination: LogWeightView(authVM: authVM)) {
                        Text("Log Weight")
                    }
                    NavigationLink(destination: LogCaloriesView(authVM: authVM)) {
                        Text("Log Calories")
                    }
                    NavigationLink(destination: WorkoutView(authVM: authVM)) {
                        Text("View Workout Data")
                    }
                    NavigationLink(destination: WeightView(authVM: authVM)) {
                        Text("View Weight Data")
                    }
                    NavigationLink(destination: CaloriesView(authVM: authVM)) {
                        Text("View Calorie Data")
                    }
                }
                    Button("Logout") {
                        logout()
                    }
                    .padding()
                    .foregroundColor(.red)
                }
            }
    }
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
            authVM.isLoggedIn = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    
    }
}
