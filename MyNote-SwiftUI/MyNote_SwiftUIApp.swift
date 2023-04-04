//
//  MyNote_SwiftUIApp.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 28/03/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MyNote_SwiftUIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
