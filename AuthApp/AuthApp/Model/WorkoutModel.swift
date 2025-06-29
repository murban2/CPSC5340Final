//
//  WorkoutModel.swift
//  AuthApp
//
//  Created by user276433 on 6/29/25.
//

import Foundation


struct WorkoutModel: Codable {
    var sets: Int
    var weight: Double
    var reps: Double
    var exercise: String
}

typealias WorkoutLog = [String : [String: WorkoutModel]]
