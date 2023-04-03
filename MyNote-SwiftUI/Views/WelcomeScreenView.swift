//
//  WelcomeScreenView.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 30/03/23.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(Constant.AppThemeColor.mainColor)
                    .ignoresSafeArea()
                VStack {
                    Text("Welcome Screen")
                    
                    Divider()
                    
                    ButtonBar(savedFunction: {
                        AnyView(RegisterLoginView(status: "LOGIN"))
                    }, buttonTitle: "Log In")
                    
                    ButtonBar(savedFunction: {
                        AnyView(RegisterLoginView(status: "REGISTER"))
                    }, buttonTitle: "Register")
                }
                .padding(.horizontal, 20)
                
            }
        }
    }
}

struct ButtonBar: View {
    
    let savedFunction: () -> AnyView
    let buttonTitle: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: geometry.size.width * 1)
                NavigationLink (destination: savedFunction()) {
                    Text(buttonTitle)
                }
            }
        }
        .frame(height: 50)
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
