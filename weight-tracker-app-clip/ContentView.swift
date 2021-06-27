//
//  ContentView.swift
//  weight-tracker-app-clip
//
//  Created by Media Guest on 27.06.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        HStack(alignment: .center, spacing: 10)  {
            Text("Hello world ")
                .font(.system(size: 24))
            Image(systemName: "scribble")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 24, height: 24)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
