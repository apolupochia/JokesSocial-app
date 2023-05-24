//
//  CraeteAccauntConfigurator.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation

protocol CraeteAccauntConfiguratorInputProtocol{
    func configure(with viewController: CraeteAccauntViewController)
}

class CraeteAccauntConfigurator : CraeteAccauntConfiguratorInputProtocol{
    func configure(with viewController: CraeteAccauntViewController) {
        let presenter = CraeteAccauntPresenter(view: viewController)
        let interactor = CraeteAccauntInteractor(presentor: presenter)
        let router = CraeteAccauntRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
