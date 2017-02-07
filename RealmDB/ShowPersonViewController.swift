//
//  ShowPersonViewController.swift
//  RealmDB
//
//  Created by Atnlie on 2/6/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import UIKit
import RealmSwift

class ShowPersonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var personTableView: UITableView!
    @IBOutlet var seearchPerson:UITextField!
    
    lazy var person : Results<Person> = { try! Realm().objects(Person.self)}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showPerson()
    }
    
    //MARK: tables
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = person[indexPath.row].name
        cell.detailTextLabel?.text = person[indexPath.row].sex
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }

    func showPerson(){
        let realm = try! Realm()
        person = realm.objects(Person.self)
        personTableView.reloadData()
    }
}
