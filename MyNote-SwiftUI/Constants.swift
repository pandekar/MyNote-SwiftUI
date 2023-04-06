//
//  Constants.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 29/03/23.
//

import Foundation
import UIKit

struct Constant {
    struct AppThemeColor {
        static let mainColor: UIColor = .systemMint
    }
    
    struct authStatus {
        static let login: String = "LOGIN"
        static let register: String = "REGISTER"
    }
    
    struct FStore {
        static let collectionName = "Notes"
        static let id = "id"
        static let title = "title"
        static let description = "description"
        static let datetime = "datetime"
        static let sender = "sender"
    }
}


