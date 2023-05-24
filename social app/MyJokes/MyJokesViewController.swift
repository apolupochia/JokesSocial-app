//
//  MyNotesViewController.swift
//  social app
//
//  Created by Алёша Виноградов on 22.05.2023.
//

import UIKit
import Firebase


protocol MyJokesViewControllerInputProtocol : AnyObject{
    func reloadData(data : MyJokes)
}

protocol MyJokesViewControllerOutputProtocol : AnyObject {
    init(view : MyJokesViewControllerInputProtocol)
    func processingReceivedData()
    func didTabBackButton()
    func didTabCreateNewNoteButton()
}

class MyJokesViewController: UIViewController {
    
    var presenter : MyJokesViewControllerOutputProtocol!
    
   
    var items : MyJokes = MyJokes(error: true, id: "", mass: [])
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.processingReceivedData()
    }
    
    @IBAction func backButton(_ sender: Any) {
        presenter.didTabBackButton()
    }
    
    @IBAction func goToCreateNote(_ sender: Any) {
        presenter.didTabCreateNewNoteButton()
    }
    
    
    func setupView(){
        tableview.delegate = self
        tableview.dataSource = self
        tableview.sectionHeaderTopPadding = 0
        tableview.tableHeaderView = UIView()
        tableview.backgroundColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! CreateNewJokeViewController
                
        let configurator: CreateNewJokeInputConfiguratorProtocol = CreateNewJokeConfigurator()
        configurator.configure(with: resultVC, and: sender as! String)
    }
    
   
    


}



extension MyJokesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.mass.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForMyJokes") as! TableViewCellForMyJokes
        cell.label1.text = items.mass[indexPath.row]
        return cell
    }
    

}

extension MyJokesViewController : MyJokesViewControllerInputProtocol{
    func reloadData(data: MyJokes) {
        if !data.error{
            self.items = data
            self.tableview.reloadData()
        }
    }
    
}
