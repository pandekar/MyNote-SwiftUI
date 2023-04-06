//
//  AddNoteView.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 28/03/23.
//

import SwiftUI
import FirebaseAuth

struct AddNoteView: View {
    
    @State var titleField: String = ""
    @State var descriptionField: String = ""
    
    @ObservedObject private var noteViewModel = NoteViewModel()
    
    @EnvironmentObject var navigationScreen: NavigationScreen
    
    func sendNoteData(title: String, description: String) {
        noteViewModel.postData(title: title, description: description)
        titleField = ""
        descriptionField = ""
        navigationScreen.currentView = .LIST_NOTE
    }
    
    var body: some View {
        ZStack {
            Color(Constant.AppThemeColor.mainColor)
                .ignoresSafeArea()
            VStack {
                TitleView(titleField: $titleField)
                
                DescriptionView(descriptionField: $descriptionField)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 5)
                        }
                    Button {
                        if titleField != "" {
                            sendNoteData(title: titleField, description: descriptionField)
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 150, height: 50)
            }
            .frame(alignment: .leading)
            .padding(.top, 50)
            .padding(.horizontal, 50)
        }
    }
}

struct TitleView: View {
    var titleField: Binding<String>
    
    var body: some View {
        VStack {
            Text("Title")
                .bold()
                .font(.system(size: 40))
                .padding(.bottom, 20)
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                TextField("insert title here...", text: titleField)
                    .padding(.horizontal, 10)
            }
            .frame(width: 300, height: 100)
        }
    }
}

struct DescriptionView: View {
    var descriptionField: Binding<String>
    
    var body: some View {
        VStack {
            Text("Description")
                .bold()
                .font(.system(size: 40))
                .padding(.bottom, 20)
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                TextField("insert description here...", text: descriptionField)
                    .padding(.horizontal, 10)
                    .frame(width: 300, height: 300, alignment: .leading)
            }
            .frame(width: 300, height: 300)
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
