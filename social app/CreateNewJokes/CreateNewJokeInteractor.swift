//
//  CreateNewNoteInteractor.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

protocol CreateNewJokeInteractorInputProtocol : AnyObject{
    init(presentor : CreateNewJokeInteractorOutputProtocol, id : String)
    func createNewNote(note : String?)
}

protocol CreateNewJokeInteractorOutputProtocol : AnyObject{
    func receiveData(data : CreateNewJoke)
    
}

class CreateNewJokeInteractor : CreateNewJokeInteractorInputProtocol{
    
    unowned var presentor : CreateNewJokeInteractorOutputProtocol
    var id : String
    
    required init(presentor: CreateNewJokeInteractorOutputProtocol, id: String) {
        self.presentor = presentor
        self.id = id
    }
    
    func createNewNote(note : String?) {
        saveNewNote(id: id, note: note)
    }
    
    private func saveNewNote(id : String, note : String?){
        
        
        guard let note = note, note != "" else { presentor.receiveData(data: CreateNewJoke(erorr: true)); return }

        var ref = DatabaseReference()
        ref = Database.database().reference()
        ref.child("users/\(id)").child("joke").updateChildValues(["\(createDate())" : "\(note)"])
        ref.child("users").child("open_users_joke").updateChildValues(["\(createDate())" : "\(note)"])
        
        presentor.receiveData(data: CreateNewJoke(erorr: false))

    }
    
    func createDate() -> String{
        let date = Date()
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
     //   dateFormatter.locale = Locale.current
        var dateNow = dateFormatterGet.string(from: date)
        dateNow =  String(dateNow.dropLast())
        dateNow =  String(dateNow.dropLast())
        dateNow =  String(dateNow.dropLast())
        
        return dateNow
    }
    
    
}


