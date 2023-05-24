//
//  LoginInInteractor.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation
import FirebaseAuth

protocol LoginInteractorInputProtocol{
    init(presentor : LoginInteractorOutputProtocol)
    func provideData(login : String?, password : String?)
}

protocol LoginInteractorOutputProtocol : AnyObject{
    func receiveData(receiveData : LoginInDate)
}


class loginInInteractor : LoginInteractorInputProtocol{
    
    unowned var presentor : LoginInteractorOutputProtocol
    
    required init(presentor: LoginInteractorOutputProtocol) {
        self.presentor = presentor
    }
    
    func provideData(login : String?, password : String?) {
        loginInAccaunt(login: login, password: password)
    // собираем данные
   //     presentor.receiveData(receiveData: LoginInDate(login: "1", password: "2"))
    }
    
    private func loginInAccaunt(login : String?, password : String?){
   //     guard let login = login , let password = password, login != "", password != "" else { return }

        Auth.auth().signIn(withEmail: (login ?? ""), password: (password ?? "")) { (result, error) in
            if let _eror = error{
                DispatchQueue.main.async {
                    self.presentor.receiveData(receiveData: LoginInDate(errorLoginOrPass: true, id: ""))
                }
               
                print(_eror.localizedDescription)
            }else{
                if let _res = result{
                    DispatchQueue.main.async {
                        self.presentor.receiveData(receiveData: LoginInDate(errorLoginOrPass: false, id: _res.user.uid))
                    }
                   
                }
            }
                    
        }
    }
    
    
}
