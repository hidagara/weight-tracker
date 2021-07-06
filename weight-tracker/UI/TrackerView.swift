//
//  TrackerView.swift
//  weight-tracker
//
//  Created by Media Guest on 03.07.2021.
//

import SwiftUI

struct TrackerView: View {
    
    @State var notes: [DailyWeight] = [
        DailyWeight(date: .now, weight: 100, caloriesBurned: 500, caloriesEated: 1500),
        DailyWeight(date: .now, weight: 105, caloriesBurned: 500, caloriesEated: 1500),
        DailyWeight(date: .now, weight: 110, caloriesBurned: 500, caloriesEated: 1500),
        DailyWeight(date: .now, weight: 99, caloriesBurned: 500, caloriesEated: 1500),
        DailyWeight(date: .now, weight: 88, caloriesBurned: 500, caloriesEated: 1500)
    ]
    
    var body: some View {
        ScrollView {
            List {
                ForEach(notes) { note in
                    Text("\(note.weight)")
                }
            }
            
            Button("Add", action: {
                withAnimation {
                    notes.append(DailyWeight(date: .now, weight: Double(Int.random(in: 90...110)), caloriesBurned: Int.random(in: 90...500), caloriesEated: Int.random(in: 500...2010)))
                }
            }).buttonStyle(.bordered)
        }
                
            
//        .toolbar{
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button("Press me") {
//                    print("Hello there")
//                }
//            }
//        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
