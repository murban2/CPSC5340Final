//
//  CalorieModel.swift
//  AuthApp
//
//  Created by user276433 on 6/29/25.
//

import Foundation

struct CalorieModel: Codable {
    var total: Double
}

typealias CalorieLog = [String : CalorieModel]
