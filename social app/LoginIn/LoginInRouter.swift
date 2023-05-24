//
//  LoginInRouter.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation


protocol LoginInRouterInputProtocol {
    init(viewController: LoginInViewController)
    func openAllNotesViewController(with id: String)
    func openCreateAccauntViewController()
}

class LoginInRouter: LoginInRouterInputProtocol {
    unowned let viewController: LoginInViewController
    
    
    
    required init(viewController: LoginInViewController) {
        self.viewController = viewController

    }
    
    func openAllNotesViewController(with id : String) {
        viewController.performSegue(withIdentifier: "goToMyAcc", sender: id)
    }
    
    func openCreateAccauntViewController() {
        viewController.performSegue(withIdentifier: "goToCreateAcc", sender: nil)
    }
}
