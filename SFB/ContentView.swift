//
//  ContentView.swift
//  SFB
//
//  Created by Amir Diafi on 4/1/23.
//

import SwiftUI

final class AuthStateModel: ObservableObject {
    @Published var isPresented = false
}

struct ContentView: View {
    @StateObject var authState = AuthStateModel()
    let authInstance = AuthenticationManager.shared
    var body: some View {
        NavigationStack {
            Settings()
        }.onAppear {
            let user = try? authInstance.getSignedUser()
            authState.isPresented = user == nil
        }
        .fullScreenCover(isPresented: $authState.isPresented) {
            NavigationStack {
                Login()
            }
        }
        .environmentObject(authState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
