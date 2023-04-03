//
//  RegisterLoginView.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 30/03/23.
//

import SwiftUI
import FirebaseAuth

struct RegisterLoginView: View {
    
    let status: String?
    @State var emailField: String = ""
    @State var passwordField: String = ""
    
    func getButtonMessage(status: String?) -> String {
        if let textMessage = status {
            return textMessage
        }
        
        return "ERROR"
    }
    
    func sendRegistrationData(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let errorMessage = error {
                print("\(errorMessage.localizedDescription)")
            } else {
                // navigation code
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color(Constant.AppThemeColor.mainColor)
                .ignoresSafeArea()
            VStack {
                customTextField(textPlaceholder: "insert email here...", textContainer: $emailField)
                customTextField(textPlaceholder: "insert password here...", textContainer: $passwordField)

                Button {
                    print(emailField)
                    print(passwordField)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 150, height: 50)
                        Text(getButtonMessage(status: status))
                            .foregroundColor(.white)
                    }
                    
                }

            }
            .padding(.horizontal, 20)
        }
    }
}

struct customTextField: View {
    
    var textPlaceholder: String = "0000"
    var textContainer: Binding<String>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height: 50)
                .overlay {
                    TextField(textPlaceholder, text: textContainer)
                        .padding()
                }
        }
        .padding(.bottom, 10)
    }
}

struct RegisterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLoginView(status: "LOGIN")
    }
}
