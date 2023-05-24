//
//  CraeteAccauntViewController.swift
//  social app
//
//  Created by Алёша Виноградов on 22.05.2023.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth


protocol CraeteAccauntViewControllerInputProtocol : AnyObject{
    func createAccauntWithError()
}

protocol CraeteAccauntViewControllerOutputProtocol{
    init(view : CraeteAccauntViewControllerInputProtocol)
    func prepareForCreateNewAccaunt(login : String?, password : String?)
    func didTabBack()
}

class CraeteAccauntViewController: UIViewController {
    
    @IBOutlet var loginTextFild: UITextField!
    @IBOutlet var passwordTextField: UITextField!
   
    @IBOutlet var invalidLoginOrPasswordLabel: UILabel!
    
    var presenter : CraeteAccauntViewControllerOutputProtocol!
    private let configurator : CraeteAccauntConfiguratorInputProtocol = CraeteAccauntConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        invalidLoginOrPasswordLabel.isHidden = true
        loginTextFild.text = ""
        passwordTextField.text = ""
    }

    @IBAction func backButton(_ sender: Any) {
        presenter.didTabBack()
    }
    
    @IBAction func createButton(_ sender: Any) {
        presenter.prepareForCreateNewAccaunt(login: loginTextFild.text, password: passwordTextField.text)
 
        
    }
    

}

extension CraeteAccauntViewController : CraeteAccauntViewControllerInputProtocol{
    
    func createAccauntWithError() {
        invalidLoginOrPasswordLabel.isHidden = false
    }
    
    
}
