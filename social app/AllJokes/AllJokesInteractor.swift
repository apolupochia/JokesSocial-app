//
//  AllNotesInteractor.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


protocol AllJokesInteractorInputProtocol{
    init(presenter: AllJokesInteractorOutputProtocol, id : String)
    func provideDetails()
}


protocol AllJokesInteractorOutputProtocol : AnyObject{
    func receiveData(data : DataForTableView)
}

class AllJokesInteractor : AllJokesInteractorInputProtocol{
    
    var id : String
    unowned var presentor : AllJokesInteractorOutputProtocol
    
    required init(presenter: AllJokesInteractorOutputProtocol, id : String) {
        self.id = id
        self.presentor = presenter
    }
    
    func provideDetails() {
        getInfo(id: id)
    }
    
    private func getInfo(id : String){
        var items : [String] = []
        var ref = DatabaseReference()
        
        
        ref = Database.database().reference()
                    
        ref.child("users").child("open_users_joke").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                DispatchQueue.main.async {
                    self.presentor.receiveData(data: DataForTableView(error: true, massiveData: []))
                }
                return
            }

            
            let value = snapshot?.value as? NSDictionary
            guard let value = value else {return}
            value.forEach { (key: Any, value: Any) in
                items.append(value as! String)
            }
            DispatchQueue.main.async {
                self.presentor.receiveData(data: DataForTableView(error: false , massiveData: items))
            }
            
  
        })
    }
}


