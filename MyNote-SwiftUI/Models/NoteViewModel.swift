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
    
    // function to post data
    func postData(note: Note) {
        do {
            _ = try databaseReference.addDocument(data: [
                Constant.FStore.id : note.id,
                Constant.FStore.title : note.title,
                Constant.FStore.description : note.description,
                Constant.FStore.datetime : note.datetime
            ])
        } catch {
            print(error.localizedDescription)
        }
    }
}
