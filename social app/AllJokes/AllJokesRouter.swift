//
//  AllNotesRouter.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation

protocol AllJokesRouterInoutProtocol{
    init(viewController : AllJokesViewController)
    func backToViewController()
    
}

class AllJokesRouter : AllJokesRouterInoutProtocol{
    
    unowned var viewController : AllJokesViewController
    
    required init(viewController: AllJokesViewController) {
        self.viewController = viewController
    }
    
    func backToViewController(){
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
