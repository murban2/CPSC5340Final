//
//  CreateExercise.swift
//  AuthApp
//
//  Created by user276433 on 6/29/25.
//

import Foundation


func loadExerciseList(filename: String) -> [String] {
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsURL.appendingPathComponent(filename)
    
    if let data = try? Data(contentsOf: fileURL),
       let exercises = try? JSONDecoder().decode([String].self, from: data) {
        return exercises
    }
    
    return []  
}


func addExercise(filename: String, newExercise: String) {
    var exercises = loadExerciseList(filename: filename)
    
    guard !exercises.contains(newExercise) else {
        print("Exercise already exists")
        return
    }
    
    exercises.append(newExercise)
    
    
    saveExercise(filename: filename, exercises: exercises)
}


func saveExercise(filename: String, exercises: [String]){
    let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let url = directory.appendingPathComponent(filename)
    
    do {
        let data = try JSONEncoder().encode(exercises)
        try data.write(to: url)
    } catch {
        print("Data couldnt be loaded")
        
    }
}
