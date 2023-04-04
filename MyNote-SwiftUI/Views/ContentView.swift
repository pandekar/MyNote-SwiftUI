//
//  ContentView.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var navigationScreen = NavigationScreen()
    
    var body: some View {
        Group {
            switch navigationScreen.currentView {
            case .LIST_NOTE:
                ListNoteView()
                    .environmentObject(navigationScreen)
            case .ADD_NOTE:
                AddNoteView()
                    .environmentObject(navigationScreen)
            default:
                WelcomeScreenView()
                    .environmentObject(navigationScreen)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
