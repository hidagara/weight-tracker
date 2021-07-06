//
//  ProfileView.swift
//  weight-tracker
//
//  Created by Media Guest on 03.07.2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Label("Profile", systemImage: "person")
            Button("Tap me", action: {
                print("tapp")
                NetworkManager().test()
            })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
