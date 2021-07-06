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
            Button("Tap me", action: {
                print("tapp")
                NetworkManager().test()
            }).buttonStyle(.bordered)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
