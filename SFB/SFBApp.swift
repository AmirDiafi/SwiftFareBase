//
//  SFBApp.swift
//  SFB
//
//  Created by Amir Diafi on 4/1/23.
//

import SwiftUI
import FirebaseCore

@main
struct SFBApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
 
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("firebase configured with appDelegate")

    return true
  }
}
