//
//  ListNoteView.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 03/04/23.
//

import SwiftUI

struct ListNoteView: View {
    
    @EnvironmentObject var navigationScreen: NavigationScreen
    
    @ObservedObject private var noteViewModel =  NoteViewModel()
    
    var body: some View {
        ZStack {
            Color(Constant.AppThemeColor.mainColor)
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 375)
            VStack {
                List{
                    ForEach(noteViewModel.notes, id: \.id) { note in
                        Text(note.title)
                    }
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.green)
                        Button {
                            navigationScreen.currentView = .ADD_NOTE
                        } label: {
                            Text("Add")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 150, height: 50)

                    Divider()
                        .frame(height: 10)
                        .padding(.horizontal, 10)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue)
                        Button {
                            print("edit selected item")
                        } label: {
                            Text("Edit")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 150, height: 50)
                    
                }
                .padding()
            }
            .padding()
        }
        .onAppear {
            self.noteViewModel.loadData()
        }
    }
}

struct ListNoteView_Previews: PreviewProvider {
    static var previews: some View {
        ListNoteView()
    }
}
