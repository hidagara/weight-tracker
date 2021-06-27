//
//  weight_trackerApp.swift
//  weight-tracker
//
//  Created by Media Guest on 27.06.2021.
//

import SwiftUI

@main
struct weight_trackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
