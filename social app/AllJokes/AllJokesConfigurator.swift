//
//  AllNotesConfigurator.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation


protocol AllJokesConfiguratorInputProtocol{
    func configure(with viewController: AllJokesViewController , and id : String)
}

class AllJokesConfigurator : AllJokesConfiguratorInputProtocol{
    func configure(with viewController: AllJokesViewController, and id: String) {
        let presentor = AllJokesPresentor(view: viewController)
        let interactor = AllJokesInteractor(presenter: presentor, id: id)
        var router = AllJokesRouter(viewController: viewController)
        
        viewController.presenter = presentor
        presentor.interactor = interactor
        presentor.router = router
        
    }
    
    
}
