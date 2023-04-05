//
//  NoteViewModel.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 04/04/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    
    private var databaseReference = Firestore.firestore().collection(Constant.FStore.collectionName)
    
    @Published var notes: Array<Note> = []
    
    // function to post data
    func postData(note: Note) {
        databaseReference.addDocument(data: [
            Constant.FStore.id : note.id,
            Constant.FStore.title : note.title,
            Constant.FStore.description : note.description,
            Constant.FStore.datetime : note.datetime
        ]) { err in
            if let err = err {
                print("error \(err)")
            } else {
                print("Note added with id: \(note.id)")
            }
        }
    }
    
    // function to load data from firebase
    func loadData() {
        databaseReference.getDocuments { querySnapshot, error in
            if let e = error {
                print("error \(e)")
            } else {
                if let snapshotDoc = querySnapshot?.documents {
                    for doc in snapshotDoc {
                        let data = doc.data()
                        let stamp = data[Constant.FStore.datetime] as! Timestamp
                        let datetime = stamp.dateValue()
                        if let title = data[Constant.FStore.title] as? String {
                            let noteObject = Note(id: data[Constant.FStore.id] as! String,
                                                  title: title,
                                                  description: data[Constant.FStore.description] as! String,
                                                  datetime: datetime
                                                )
                            
                            self.notes.append(noteObject)
                        }
                    }
                }
            }
        }
    }
        
}
