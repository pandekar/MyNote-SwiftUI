//
//  ContentView.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var navigationScreen = NavigationScreen()
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    var body: some View {
        Group {
            switch navigationScreen.currentView {
            case .LIST_NOTE:
                ListNoteView()
                    .environmentObject(navigationScreen)
                    .transition(transition)
            case .ADD_NOTE:
                AddNoteView()
                    .environmentObject(navigationScreen)
                    .transition(transition)
            default:
                WelcomeScreenView()
                    .environmentObject(navigationScreen)
                    .transition(transition)
            }
        }
        .animation(.default, value: navigationScreen.currentView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
