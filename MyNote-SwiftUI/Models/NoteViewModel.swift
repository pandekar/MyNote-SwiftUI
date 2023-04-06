//
//  NoteViewModel.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 04/04/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class NoteViewModel: ObservableObject {
    
    private var databaseReference = Firestore.firestore().collection(Constant.FStore.collectionName)
    
    @Published var notes: Array<Note> = []
    
    // function to post data
    func postData(title: String, description: String) {
        if let sender = Auth.auth().currentUser?.email {
            let id = UUID().uuidString
            let datetime = Date.now
            
            databaseReference.addDocument(data: [
                Constant.FStore.id : id,
                Constant.FStore.title : title,
                Constant.FStore.description : description,
                Constant.FStore.datetime : datetime,
                Constant.FStore.sender : sender
            ]) { err in
                if let err = err {
                    print("error \(err)")
                } else {
                    print("Note added with id: \(id)")
                }
            }
        }
    }
    
    // function to load data from firebase
    func loadData() {
        databaseReference.order(by: Constant.FStore.datetime).getDocuments { querySnapshot, error in
            if let e = error {
                print("error \(e)")
            } else {
                if let snapshotDoc = querySnapshot?.documents {
                    for doc in snapshotDoc {
                        let data = doc.data()
                        let stamp = data[Constant.FStore.datetime] as! Timestamp
                        let datetime = stamp.dateValue()
                        let sender = data[Constant.FStore.sender] as! String
                        if let currentUser = Auth.auth().currentUser?.email {
                            if sender == currentUser {
                                self.notes.append(Note(id: data[Constant.FStore.id] as! String,
                                                       title: data[Constant.FStore.title] as! String,
                                                       description: data[Constant.FStore.description] as! String,
                                                       datetime: datetime,
                                                       sender: currentUser))
                            }
                        }
                    }
                }
            }
        }
    }
        
}
