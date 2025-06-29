//
//  WeightModel.swift
//  AuthApp
//
//  Created by user276433 on 6/29/25.
//

import Foundation



struct WeightModel: Codable {
    var weight: Double
}

typealias WeightLog = [String : WeightModel]
