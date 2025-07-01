//
//  WeightView.swift
//  AuthApp
//
//  Created by user276433 on 6/28/25.
//

import SwiftUI
import Charts

struct WeightView: View {
    @ObservedObject var authVM: AuthViewModel
    @State private var weightLog : [String : WeightModel] = [:]
    
    var body: some View {
        Text("Daily Weight Data")
            .padding()
            .fontWeight(.bold)
        
        Chart {
            ForEach (weightLog.sorted(by: {$0.key < $1.key}), id: \.key) { date, entry in
                LineMark(
                    x: .value("Date", date),
                    y: .value("Weight", entry.weight)
                )
            }
        }
        .onAppear() {
            weightLog = loadWeightLog(filename: "Weight_\(authVM.uid ?? "unknown").json")
        }
        .frame(height: 250)
    }
        
}


