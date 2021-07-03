//
//  ContentView.swift
//  weight-tracker
//
//  Created by Media Guest on 27.06.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView() {
            ProfileView().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
