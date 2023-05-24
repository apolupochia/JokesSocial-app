//
//  CreateNewNotePresentor.swift
//  social app
//
//  Created by Алёша Виноградов on 24.05.2023.
//

import Foundation

struct CreateNewJoke{
    var erorr : Bool
}


class CreateNewJokePresentor : CreateNewJokeViewControllerOutputProtocol{
    
    unowned var view : CreateNewJokeViewControllerInputProtocol
    var interactor : CreateNewJokeInteractorInputProtocol!
    var router : CreateNewJokeRouterInputProtocol!
    
    required init(view: CreateNewJokeViewControllerInputProtocol) {
        self.view = view
    }
    
    func processingReceivedData(note : String?) {
        interactor.createNewNote(note: note)
    }
    
    func didTabBackButton() {
        router.backToMyJokesViewController()
    }
    
}

extension CreateNewJokePresentor : CreateNewJokeInteractorOutputProtocol{
    func receiveData(data: CreateNewJoke) {
        if data.erorr{
            view.doneWithError()
        } else {
            router.backToMyJokesViewController()
        }
    }
    
    
}
