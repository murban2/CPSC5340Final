//
//  LogWeightViewModel.swift
//  AuthApp
//
//  Created by user276433 on 6/29/25.
//

import Foundation



func loadWeightLog(filename: String) -> WeightLog {
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(filename)
    
    if let data = try? Data(contentsOf: fileURL),
       let log = try? JSONDecoder().decode(WeightLog.self, from: data) {
        return log
    }
    
    
    return [:]
}

func addOrUpdateWeightEntry(filename: String, newWeight: Double) {
    
    var log = loadWeightLog(filename: filename)
    
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let todayString = formatter.string(from:Date())
    
    
    log[todayString] = WeightModel(weight: newWeight)
    
    
    saveWeightLogToFile(log: log, filename: filename)
}


    
func loadTodaysWeight(filename: String) -> Double {
    if filename == "unknown" {
        return 0.00
    }
    
    
    let log = loadWeightLog(filename: filename)

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let todayString = formatter.string(from: Date())

    return log[todayString]?.weight ?? 0.00
}
    


func saveWeightLogToFile(log: WeightLog, filename: String) {
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(filename)
    
    do {
        let data = try JSONEncoder().encode(log)
        try data.write(to: fileURL)
    } catch {
        print("Failed to save Weight log:", error)
    }
}
