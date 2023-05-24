//
//  LoginInPresentor.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation

struct LoginInDate{
    let errorLoginOrPass : Bool
    let id : String
}


class loginInPresentor: LoginInViewOutputProtocol{
    
    unowned let view : LoginInViewInputProtocol
    var interctor : LoginInteractorInputProtocol!
    var router: LoginInRouterInputProtocol!
    
    required init(view: LoginInViewInputProtocol) {
        self.view = view
    }
    
    func didTabLogin(login: String?, password: String?) {
        interctor.provideData(login: login, password: password)
    }
    
    func didTabCreateAccount() {
        router.openCreateAccauntViewController()
    }
}

extension loginInPresentor : LoginInteractorOutputProtocol{
    func receiveData(receiveData: LoginInDate) {
        if !receiveData.errorLoginOrPass{
            router.openAllNotesViewController(with: receiveData.id)
        } else {
            view.errorInter()
        }
    }
}
