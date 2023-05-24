//
//  CreateNewNoteConfigurator.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation


protocol CreateNewJokeInputConfiguratorProtocol{
    func configure(with viewController : CreateNewJokeViewController, and id : String )
}

class CreateNewJokeConfigurator : CreateNewJokeInputConfiguratorProtocol{
    func configure(with viewController: CreateNewJokeViewController, and id: String) {
        let presentor = CreateNewJokePresentor(view: viewController)
        let interactor = CreateNewJokeInteractor(presentor: presentor, id: id)
        let router = CreateNewJokeRouter(viewCintroller: viewController)
        
        viewController.presenter = presentor
        presentor.interactor = interactor
        presentor.router = router
    }
    
    
}
