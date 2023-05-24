//
//  CreateNewNoteViewController.swift
//  social app
//
//  Created by Алёша Виноградов on 22.05.2023.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth

protocol CreateNewJokeViewControllerInputProtocol : AnyObject{
    func doneWithError()
}

protocol CreateNewJokeViewControllerOutputProtocol{
    init( view : CreateNewJokeViewControllerInputProtocol)
    func processingReceivedData(note : String?)
    func didTabBackButton()
    
}

class CreateNewJokeViewController: UIViewController {

    @IBOutlet var newNote: UITextField!
    
    @IBOutlet var errorTextlabel: UILabel!
    
    var presenter : CreateNewJokeViewControllerOutputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        errorTextlabel.isHidden = true
        newNote.text = ""
    }
  
    
    
    @IBAction func saveButton(_ sender: Any) {
        presenter.processingReceivedData(note: newNote.text)
    }
    
    @IBAction func backButton(_ sender: Any) {
        presenter.didTabBackButton()
    }
    

}




extension CreateNewJokeViewController : CreateNewJokeViewControllerInputProtocol{
    func doneWithError() {
        errorTextlabel.isHidden = false
    }
    

    
}
