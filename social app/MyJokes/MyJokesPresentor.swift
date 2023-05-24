//
//  MyNotesPresentor.swift
//  social app
//
//  Created by Алёша Виноградов on 23.05.2023.
//

import Foundation

struct MyJokes{
    var error : Bool
    var id : String
    var mass : [String]
}

class MyJokesPresentor : MyJokesViewControllerOutputProtocol{

    
    
    unowned var view : MyJokesViewControllerInputProtocol
    var interactor : MyJokesInteractorInputProtocol!
    var router : MyJokesRouterInputProtocol!
    
    required init(view: MyJokesViewControllerInputProtocol) {
        self.view = view
    }
    
    func processingReceivedData() {
        interactor.provideDetails()
    }
    
    func didTabBackButton() {
        router.backButton()
    }
    
    func didTabCreateNewNoteButton() {
        interactor.getIdForCreate()
    }
    
    
}

extension MyJokesPresentor : MyJokesInteractorOutputProtocol{
    
    func goToCreateNewNote(id: String) {
        router.createNewNote(id: id)
    }
    
    func receiveData(data: MyJokes) {
        view.reloadData(data: data)
    }
    

    
    
}
