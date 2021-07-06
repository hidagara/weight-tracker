//
//  DailyWeight.swift
//  weight-tracker
//
//  Created by Media Guest on 07.07.2021.
//

import Foundation

struct DailyWeight: Identifiable {
    let id = UUID()
    
    let date: Date
    let weight: Double
    let caloriesBurned: Int
    let caloriesEated: Int
}
