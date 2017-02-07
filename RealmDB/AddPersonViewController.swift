//
//  AddPersonViewController.swift
//  RealmDB
//
//  Created by Atnlie on 2/3/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
    @IBOutlet var personName : UITextField!
    @IBOutlet var personAge : UITextField!
    @IBOutlet var personSex : UITextField!
    @IBOutlet var personDog : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func clearTextField(){
        personAge.text = ""
        personName.text = ""
        personDog.text = ""
        personSex.text = ""
    }
    
    //MARK: add new Person
    @IBAction func saveButton_Clicked(_ sender:UIButton){
        let personVM = PersonViewModel()
        if personVM.saveNewPerson(self){
            clearTextField()
        }
    }
    
    @IBAction func saveAndBackButton_Clicked(_ sender:UIButton){
        let personVM = PersonViewModel()
        if personVM.saveNewPerson(self){
            clearTextField()
            _ = navigationController?.popToRootViewController(animated: true)
        }
    }
}
