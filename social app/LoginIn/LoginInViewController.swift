//
//  ViewController.swift
//  social app
//
//  Created by Алёша Виноградов on 22.05.2023.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth


protocol LoginInViewInputProtocol : AnyObject{      // методы необходимо реализовать в самом ViewController
    func errorInter()
}
protocol LoginInViewOutputProtocol{     // методы необходимо реализовать в presentor
    init(view : LoginInViewInputProtocol)
    func didTabLogin(login: String?, password : String?)
    func didTabCreateAccount()
}

class LoginInViewController: UIViewController {
    @IBOutlet var loginTextFild: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLoginOrPassword: UILabel!
    
    
    var presentor : LoginInViewOutputProtocol!
    private let configurator : LoginInConfiguratorInputProtocol = LoginInConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configur(with: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTextFild.text = ""
        passwordTextField.text = ""
        errorLoginOrPassword.isHidden = true
    }
    
    @IBAction func enterButton(_ sender: Any) {
        presentor.didTabLogin(login: loginTextFild.text , password: passwordTextField.text)
        
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        presentor.didTabCreateAccount()
        
    }
   
}


extension LoginInViewController : LoginInViewInputProtocol {
    func errorInter() {
        errorLoginOrPassword.isHidden = false
    }
}

extension LoginInViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != "goToCreateAcc" else { return }
        
        let tabCtrl: UITabBarController = segue.destination as! UITabBarController
        let destinationVC0 = tabCtrl.viewControllers![0] as! AllJokesViewController
        let configurator: AllJokesConfiguratorInputProtocol = AllJokesConfigurator()
        configurator.configure(with: destinationVC0, and: sender as! String)
        
        
        
        let destinationVC1 = tabCtrl.viewControllers![1] as! MyJokesViewController
        let configurator1: MyJokesConfiguratorInputProtocol = MyNotesConfigurator()
        configurator1.configure(with: destinationVC1, and: sender as! String)
    }
}




//        FIRAuth.auth().addStateDidChangeListener { (auth, user) in
//            if user != nil {
//                self.performSegue(withIdentifier: "goToMyAcc", sender: nil)
//            }
//        }
