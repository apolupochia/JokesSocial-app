//
//  MyNotesInteractor.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

protocol MyJokesInteractorInputProtocol{
    init(presenter :  MyJokesInteractorOutputProtocol, id : String)
    func provideDetails()
    func getIdForCreate()
}

protocol MyJokesInteractorOutputProtocol : AnyObject{
    func receiveData(data : MyJokes)
    func goToCreateNewNote(id : String)
}

class MyJokesInteractor : MyJokesInteractorInputProtocol{
    
    
    
    unowned var presentor : MyJokesInteractorOutputProtocol
    var id : String
    
    required init(presenter: MyJokesInteractorOutputProtocol, id: String) {
        self.presentor = presenter
        self.id = id
    }
    
    func getIdForCreate() {
        presentor.goToCreateNewNote(id: id)
    }

    func provideDetails() {
        getInfo(id: id)
    }
    
    func getInfo(id : String){
        var ref = DatabaseReference()
        ref = Database.database().reference()
        var items : [String] = []
        
        
        ref.child("users/\(id)/joke").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                DispatchQueue.main.async {
                    self.presentor.receiveData(data: MyJokes(error: true, id: id, mass: items))
                }
                return
            }
            let value = snapshot?.value as? NSDictionary
            guard let value = value else {return}
            value.forEach { (key: Any, value: Any) in
                items.append(value as! String)
            }
            
            DispatchQueue.main.async {
                self.presentor.receiveData(data: MyJokes(error: false, id : id, mass: items))
            }
        })
    }
    
}
