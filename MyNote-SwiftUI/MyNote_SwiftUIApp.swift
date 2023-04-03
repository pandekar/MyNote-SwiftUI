//
//  MyNote_SwiftUIApp.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 28/03/23.
//

import SwiftUI
import FirebaseCore

@main
struct MyNote_SwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomeScreenView()
        }
    }
}
