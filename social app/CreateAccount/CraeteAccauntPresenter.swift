//
//  CraeteAccauntPresenter.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation


class CraeteAccauntPresenter : CraeteAccauntViewControllerOutputProtocol{

    
    
    unowned var view : CraeteAccauntViewControllerInputProtocol
    
    var interactor : CraeteAccauntInteractorInputProtocol!
    var router : CraeteAccauntRouterInputProtocol!
    
    required init(view: CraeteAccauntViewControllerInputProtocol) {
        self.view = view
        
    }
    
    func prepareForCreateNewAccaunt(login: String?, password: String?) {
        interactor.createNewAcc(login: login, password: password)
    }
    
    func didTabBack(){
        router.goToViewController()
    }
    
    
}

extension CraeteAccauntPresenter : CraeteAccauntInteractorOutputProtocol{
    func resultOfCreate(answer : Bool) {
        if answer{
            router.goToViewController()
        } else {
            view.createAccauntWithError()
        }
    }
    
    
}
