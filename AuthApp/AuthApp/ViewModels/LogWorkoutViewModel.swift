//
//  LogWorkoutViewModel.swift
//  AuthApp
//
//  Created by user276433 on 6/29/25.
//

import Foundation


func loadWorkoutLog(filename: String) -> WorkoutLog {
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(filename)
    
    if let data = try? Data(contentsOf: fileURL),
       let log = try? JSONDecoder().decode(WorkoutLog.self, from: data) {
        return log
    }
    
    
    return [:]
}




func addOrUpdateWorkoutEntry(filename: String, model: WorkoutModel) {
    
    var log = loadWorkoutLog(filename: filename)
    
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let todayString = formatter.string(from:Date())
    
    var dayLog = log[todayString] ?? [:]
    dayLog[model.exercise] = model
    log[todayString] = dayLog
    
    
    
    saveWorkoutLogToFile(log: log, filename: filename)
}


    
func loadTodaysWorkout(filename: String) -> [String: WorkoutModel] {
    
    let log = loadWorkoutLog(filename: filename)

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let todayString = formatter.string(from: Date())

    return log[todayString] ?? [:]
}
    


func saveWorkoutLogToFile(log: WorkoutLog, filename: String) {
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(filename)
    
    do {
        let data = try JSONEncoder().encode(log)
        try data.write(to: fileURL)
    } catch {
        print("Failed to save Workout log:", error)
    }
}
