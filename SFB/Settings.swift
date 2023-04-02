//
//  Settings.swift
//  SFB
//
//  Created by Amir Diafi on 4/1/23.
//

import SwiftUI

final class SettingsViewModel {
    @EnvironmentObject var authState: AuthStateModel
    
    func logout() {
        Task {
            do {
                try AuthenticationManager.shared.signOut()
                authState.isPresented = true
            } catch {
                print("can't logout")
            }
        }
    }
    
}

struct Settings: View {
    let instance = SettingsViewModel()
    var body: some View {
        List {
            Button("Logout") {
                instance.logout()
            }
        }.navigationTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
