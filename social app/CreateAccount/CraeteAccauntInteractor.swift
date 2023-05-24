//
//  CraeteAccauntInteractor.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth


protocol CraeteAccauntInteractorInputProtocol{
    init(presentor : CraeteAccauntInteractorOutputProtocol)
    func createNewAcc(login : String?, password : String?)
}

protocol CraeteAccauntInteractorOutputProtocol : AnyObject{
    func resultOfCreate(answer : Bool)
}


class CraeteAccauntInteractor : CraeteAccauntInteractorInputProtocol{
    
    
    unowned var presentor : CraeteAccauntInteractorOutputProtocol
    
    required init(presentor: CraeteAccauntInteractorOutputProtocol) {
        self.presentor = presentor
    }
    
    func createNewAcc(login : String?, password : String?) {
        guard let login = login , let  password = password, login != "", password != "" else { presentor.resultOfCreate(answer: false); return }
       
        Auth.auth().createUser(withEmail: (login), password: (password)) { (result, error) in
                   if let _eror = error {
                       print(_eror.localizedDescription )
                       DispatchQueue.main.async {
                           self.presentor.resultOfCreate(answer: false)
                       }
                      
                   }else{
                       //user registered successfully
                       if let _res = result{
                           print(_res)
                           DispatchQueue.main.async {
                               self.presentor.resultOfCreate(answer: true)
                           }
                       }
                   }
                }
    }
    
    
}
