//
//  LoginInConfigurator.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation

protocol LoginInConfiguratorInputProtocol{
    func configur(with view : LoginInViewController)
}


class LoginInConfigurator : LoginInConfiguratorInputProtocol{
    
    func configur(with view: LoginInViewController) {
        let presentor = loginInPresentor(view: view)
        let interactor = loginInInteractor(presentor: presentor)
        let router = LoginInRouter(viewController: view)
        
        view.presentor = presentor
        presentor.interctor = interactor
        presentor.router = router
    }
    
    
}
