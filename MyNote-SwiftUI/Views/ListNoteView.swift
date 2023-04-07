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
        NavigationView {
            ZStack {
                Color(Constant.AppThemeColor.mainColor)
                    .ignoresSafeArea()
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .frame(width: 375)
                VStack {
                    List{
                        ForEach(noteViewModel.notes, id: \.id) { note in
                            NavigationLink(destination: DetailView(noteDetail: note)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(.blue)
                                    Text(note.title)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }

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
                }
                .padding()
            }
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
