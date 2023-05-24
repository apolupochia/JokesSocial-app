//
//  CraeteAccauntRouter.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation

protocol CraeteAccauntRouterInputProtocol{
    init(viewController : CraeteAccauntViewController)
    func goToViewController()
    
}

class CraeteAccauntRouter : CraeteAccauntRouterInputProtocol{
    
    unowned var viewController : CraeteAccauntViewController
    
    required init(viewController: CraeteAccauntViewController) {
        self.viewController = viewController
    }
    
    func goToViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    
}
