//
//  allNotesViewController.swift
//  social app
//
//  Created by Алёша Виноградов on 22.05.2023.
//

import UIKit


protocol AllJokesViewControllerInputProtocol : AnyObject{
    func reloadTableView(data : DataForTableView)
}

protocol AllJokesViewControllerOutputProtocol{
    init(view : AllJokesViewControllerInputProtocol)
    func processingReceivedData()
    func didTabBackButton()
}


class AllJokesViewController: UIViewController {
    
    var presenter: AllJokesViewControllerOutputProtocol!

    @IBOutlet var tableView: UITableView!
    
    var dataItems : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sutupInfo()
      

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.processingReceivedData()
    }

    func sutupInfo(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.tableHeaderView = UIView()
        tableView.backgroundColor = UIColor.white
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        presenter.didTabBackButton()
    }
}


extension AllJokesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForAllJokes") as! TableViewCellForAllJokes
        cell.cellForAllNotes.text = dataItems[indexPath.row]
        return cell
    }
}


extension AllJokesViewController : AllJokesViewControllerInputProtocol{
    
    func reloadTableView(data: DataForTableView) {
        if !data.error{
            self.dataItems = data.massiveData
            tableView.reloadData()
        } else {
            print("error")
        }
    }

    
}
