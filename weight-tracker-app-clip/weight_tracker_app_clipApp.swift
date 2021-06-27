//
//  weight_tracker_app_clipApp.swift
//  weight-tracker-app-clip
//
//  Created by Media Guest on 27.06.2021.
//

import SwiftUI

@main
struct weight_tracker_app_clipApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
