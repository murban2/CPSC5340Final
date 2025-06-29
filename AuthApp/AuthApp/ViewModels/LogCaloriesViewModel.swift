//
//  LogCaloriesViewModel.swift
//  AuthApp
//
//  Created by user276433 on 6/29/25.
//

import Foundation



func loadCalorieLog(filename: String) -> CalorieLog {
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(filename)
    
    if let data = try? Data(contentsOf: fileURL),
       let log = try? JSONDecoder().decode(CalorieLog.self, from: data) {
        return log
    }
    
    
    return [:]
}

func addOrUpdateCalorieEntry(filename: String, newTotal: Double) {
    
    var log = loadCalorieLog(filename: filename)
    
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let todayString = formatter.string(from:Date())
    
    if log[todayString] != nil {
        log[todayString] = CalorieModel(total: newTotal + log[todayString]!.total)
    } else {
        log[todayString] = CalorieModel(total: newTotal)
    }
    
    saveCalorieLogToFile(log: log, filename: filename)
}


    
func loadTodaysCalories(filename: String) -> Double {
    if filename == "unknown" {
        return 0.00
    }
    
    
    let log = loadCalorieLog(filename: filename)

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let todayString = formatter.string(from: Date())

    return log[todayString]?.total ?? 0.00
}
    


func saveCalorieLogToFile(log: CalorieLog, filename: String) {
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(filename)
    
    do {
        let data = try JSONEncoder().encode(log)
        try data.write(to: fileURL)
    } catch {
        print("Failed to save calorie log:", error)
    }
}
