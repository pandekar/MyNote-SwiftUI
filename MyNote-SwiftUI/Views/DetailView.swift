//
//  DetailView.swift
//  MyNote-SwiftUI
//
//  Created by Pande Adhistanaya on 06/04/23.
//

import SwiftUI

struct DetailView: View {
    
    var noteDetail: Note
    
    var body: some View {
        ZStack {
            Color(Constant.AppThemeColor.mainColor)
                .ignoresSafeArea()
                VStack {
                    
                    detailTitleView(titleDetail: noteDetail.title)
                    
                    detailDescription(descriptionDetail: noteDetail.description)
                    
                    Spacer(minLength: 50)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 5)
                            }
                        Button {
                            print("UPDATE to firebase")
                        } label: {
                            Text("Update")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 150, height: 50)
                }
                .frame(width: 300, height: 300)
                .padding(.top, 50)
                .padding(.horizontal, 50)
            
        }
    }
}

struct detailTitleView: View {
    var titleDetail: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .bold()
                .font(.system(size: 40))
                .padding(.bottom, 20)
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                Text(titleDetail)
                    .padding(.horizontal, 10)
            }
            .frame(width: 300, height: 100)
        }
    }
}

struct detailDescription: View {
    var descriptionDetail: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .bold()
                .font(.system(size: 40))
                .padding(.bottom, 20)
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                Text(descriptionDetail)
                    .padding(.horizontal, 10)
            }
            .frame(width: 300, height: 300)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(noteDetail: Note(id: "1", title: "baba", description: "yaga", datetime: Date.now, sender: "me"))
    }
}
