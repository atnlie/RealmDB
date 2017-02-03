//
//  ViewController.swift
//  RealmDB
//
//  Created by Atnlie on 2/2/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import UIKit
import RealmSwift

class ShowDogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet var searchName : UITextField!
    @IBOutlet var tableView : UITableView!
    
    lazy var dog : Results<Dog> = { try! Realm().objects(Dog.self) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchName.delegate = self
        print(try! Realm().configuration.fileURL!)
        //checkRealmTable()
        //add_dog()
    }

    override func viewWillAppear(_ animated: Bool) {
        showDog()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDog" {
            print("dog")
        }else{
            print("yang lain")
        }
    }
    
    //MARK: - tables
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dog[indexPath.row].name
        cell.detailTextLabel?.text = String(dog[indexPath.row].age)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dog.count
    }
    
    //MARK: realm
    func checkRealmTable(){
        let realm = try! Realm()
        print(realm.configuration.fileURL!)
        if realm.objects(Person.self).count <= 0 {
            //add_person()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let realm = try! Realm()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            if (self.searchName.text?.characters.count)! > 0{
                let predicate = NSPredicate(format: "name CONTAINS [c] %@", self.searchName.text!)
                self.dog = realm.objects(Dog.self).filter(predicate)
                self.tableView.reloadData()
            }else{
               self.showDog()
            }
        }
        return true
    }
    
    func showDog(){
        let realm = try! Realm()
        dog = realm.objects(Dog.self)
        tableView.reloadData()
    }

}

