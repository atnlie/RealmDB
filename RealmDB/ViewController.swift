//
//  ViewController.swift
//  RealmDB
//
//  Created by Atnlie on 2/2/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet var searchName : UITextField!
    @IBOutlet var tableView : UITableView!
    
    let realm = try! Realm()
    lazy var person : Results<Person> = { self.realm.objects(Person.self) }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchName.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        checkRealmTable()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = person[indexPath.row].name
        cell.detailTextLabel?.text = String(person[indexPath.row].age)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    //MARK: realm
    func checkRealmTable(){
        print(realm.configuration.fileURL!)
        if realm.objects(Person.self).count <= 0 {
            add_person()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            if (self.searchName.text?.characters.count)! > 0{
                let predicate = NSPredicate(format: "name CONTAINS [c] %@", self.searchName.text!)
                self.person = self.realm.objects(Person.self).filter(predicate)
                self.tableView.reloadData()
            }else{
               self.searchPerson()
            }
        }
        return true
    }
    
    func searchPerson(){
        person = realm.objects(Person.self)
        tableView.reloadData()
        
    }
    
    func add_person(){
        let person = Person()
//        person.name = "Anton"
//        person.age = 30
//        person.sex = "Male"
//        
//        try! realm.write {
//            realm.add(person)
//        }
        
//        person.name = "Budi"
//        person.age = 34
//        person.sex = "Male"
//        
//        try! realm.write {
//            realm.add(person)
//        }
        
//        person.name = "Any"
//        person.age = 25
//        person.sex = "Female"
//        
//        try! realm.write {
//            realm.add(person)
//        }
//
//        person.name = "Beny"
//        person.age = 40
//        person.sex = "Male"
//        
//        try! realm.write {
//            realm.add(person)
//        }
//
//        person.name = "Carly"
//        person.age = 45
//        person.sex = "Male"
//        
//        try! realm.write {
//            realm.add(person)
//        }
        
        person.name = "Cichie"
        person.age = 29
        person.sex = "Female"
        
        try! realm.write {
            realm.add(person)
        }
        
    }
}

