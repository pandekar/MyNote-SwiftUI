//
//  NavigationScreen.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 04/04/23.
//

import Foundation

class NavigationScreen: ObservableObject {
    
    enum CurrentView {
        case ADD_NOTE
        case WELCOME_SCREEN
        case REGISTER_LOGIN
        case LIST_NOTE
    }
    
    @Published var currentView = CurrentView.WELCOME_SCREEN
    
}
