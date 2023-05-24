//
//  CreateNewNoteRouter.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation

protocol CreateNewJokeRouterInputProtocol{
    init(viewCintroller : CreateNewJokeViewController)
    func backToMyJokesViewController()
}

class CreateNewJokeRouter: CreateNewJokeRouterInputProtocol{
    
    unowned var viewController : CreateNewJokeViewController
    
    required init(viewCintroller: CreateNewJokeViewController) {
        self.viewController = viewCintroller
    }
    
    func backToMyJokesViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
