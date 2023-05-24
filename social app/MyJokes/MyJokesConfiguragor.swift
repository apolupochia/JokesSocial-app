//
//  MyNotesConfiguragor.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation


protocol MyJokesConfiguratorInputProtocol{
    func configure(with viewController : MyJokesViewController, and id : String )
}

class MyNotesConfigurator : MyJokesConfiguratorInputProtocol{
    func configure(with viewController: MyJokesViewController, and id: String) {
        let presenter = MyJokesPresentor(view: viewController)
        let interactor = MyJokesInteractor(presenter: presenter, id: id)
        let router = MyJokesRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        
    }
    
    
}
