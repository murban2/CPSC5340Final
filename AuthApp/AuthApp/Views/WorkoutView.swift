//
//  WorkoutView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI
import Charts

struct WorkoutView: View {
    
    @ObservedObject var authVM: AuthViewModel
    
    @State private var exerciseList: [String] = []
    @State private var selectedExercise: String = ""
    @State private var workoutLog: [String : [String: WorkoutModel]] = [:]
    @State private var flattenedWorkout : [(date: String, exerciseName: String, workout: WorkoutModel)] = []
    
    
    var body: some View {
        List {
            Picker("Select Exercise", selection: $selectedExercise) {
                ForEach(exerciseList, id: \.self) { exercise in
                    Text(exercise)
                }
            }
            .pickerStyle(.wheel)
            .padding()
            .foregroundStyle(.black)
            
            Text("Number of Sets")
            Chart {
                ForEach(flattenedWorkout, id: \.exerciseName) { item in
                    LineMark(
                        x: .value("Date", item.date),
                        y: .value("Num Of Sets", item.workout.sets)
                    )
                }
            }
            .frame(height: 250)
            
            Text("Average Weight")
            Chart {
                ForEach(flattenedWorkout, id: \.exerciseName) { item in
                    LineMark(
                        x: .value("Date", item.date),
                        y: .value("Average Weight", item.workout.weight)
                    )
                }
            }
            .frame(height: 250)
            
            Text("Average Reps")
            Chart {
                ForEach(flattenedWorkout, id: \.exerciseName) { item in
                    LineMark(
                        x: .value("Date", item.date),
                        y: .value("Num Of Reps", item.workout.reps)
                    )
                }
            }
            .frame(height: 250)
            
            
        }
        
        .onAppear {
            exerciseList = loadExerciseList(filename: "Exercise_\(authVM.uid ?? "unknown").json")
            workoutLog = loadWorkoutLog(filename: "Workout_\(authVM.uid ?? "unknown").json")
            
            if let first = exerciseList.first {
                selectedExercise = first
            }
            flattenedWorkout = flatData(log: workoutLog, exercise: selectedExercise)
        }
        .onChange(of: selectedExercise) { _, newValue in
            flattenedWorkout = flatData(log: workoutLog, exercise: newValue)
        }
    
    }
    
    
    
    func flatData(log : [String : [String: WorkoutModel]], exercise: String) -> [(date: String, exerciseName: String, workout: WorkoutModel)] {
        
        let flattenedWorkouts: [(date: String, exerciseName: String, workout: WorkoutModel)] = workoutLog.flatMap { date, exercises in
            exercises.map { exerciseName, workout in
                (date, exerciseName, workout)
            }
        }.sorted { $0.date < $1.date }
        
        return flattenedWorkouts
            .filter { $0.exerciseName == exercise }
    }
    
}


