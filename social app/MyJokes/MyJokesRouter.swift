//
//  MyNotesRouter.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation

protocol MyJokesRouterInputProtocol{
    init(viewController : MyJokesViewController)
    func backButton()
    func createNewNote(id : String)
}

class MyJokesRouter : MyJokesRouterInputProtocol{
    
    unowned var viewController : MyJokesViewController
    
    required init(viewController: MyJokesViewController) {
        self.viewController = viewController
    }
    
    func backButton() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func createNewNote(id : String) {
        viewController.performSegue(withIdentifier: "goToCreateNewNote", sender: id)
    }
    
    
}
