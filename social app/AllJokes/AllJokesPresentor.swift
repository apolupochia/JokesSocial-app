//
//  AllNotesPresentor.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation

struct DataForTableView{
    let error : Bool
    let massiveData : [String]
}

class AllJokesPresentor : AllJokesViewControllerOutputProtocol{

    
    
    unowned var view : AllJokesViewControllerInputProtocol
    var interactor : AllJokesInteractorInputProtocol!
    var router : AllJokesRouterInoutProtocol!
    
    required init(view: AllJokesViewControllerInputProtocol) {
        self.view = view
    }
    
    func processingReceivedData() {
        interactor.provideDetails()
    }
    
    func didTabBackButton() {
        router.backToViewController()
    }
    
    
}

extension AllJokesPresentor : AllJokesInteractorOutputProtocol{
    func receiveData(data: DataForTableView) {
        view.reloadTableView(data: data)
    }
    
    
}
