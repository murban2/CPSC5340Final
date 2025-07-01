//
//  CaloriesView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI
import Charts

struct CaloriesView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var calorieLog : [String : CalorieModel] = [:]
    
    var body: some View {
        Text("Daily Calorie Data")
            .padding()
            .fontWeight(.bold)
        Chart {
            ForEach (calorieLog.sorted(by: {$0.key < $1.key}), id: \.key) { date, entry in
                LineMark(
                    x: .value("Date", date),
                    y: .value("Calories", entry.total)
                )
            }
        }
        .onAppear() {
            calorieLog = loadCalorieLog(filename: "Calorie_\(authVM.uid ?? "unknown").json")
        }
        .frame(height: 250)
    }
}

