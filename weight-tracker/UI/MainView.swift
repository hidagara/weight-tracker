//
//  ContentView.swift
//  weight-tracker
//
//  Created by Media Guest on 27.06.2021.
//

import SwiftUI
import CoreData

struct MainView: View {
    var body: some View {
        TabView() {
            TrackerView().tabItem {
                Label("Tracker", systemImage: "list.dash")
            }
            HistoryView().tabItem {
                Label("History", systemImage: "leaf.fill")
            }
            ProfileView().tabItem {
                    Label("Profile", systemImage: "person")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
