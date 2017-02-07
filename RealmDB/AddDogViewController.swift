//
//  AddDogViewController.swift
//  RealmDB
//
//  Created by Atnlie on 2/3/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import UIKit
import RealmSwift

class AddDogViewController: UIViewController {
    @IBOutlet weak var dogName: UITextField!
    @IBOutlet var dogAge : UITextField!
    @IBOutlet var dogOwner : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearTextField(){
        dogAge.text = ""
        dogName.text = ""
        dogOwner.text = ""
    }
    
    //MARK: - Button actions
    @IBAction func saveButton_Clicked(_ sender: UIButton) {
        if (self.dogName.text?.characters.count)! <= 0 {
            self.alert(message: "Please input Name",title: "Warning")
        }else if (self.dogAge.text?.characters.count)! <= 0{
            self.alert(message: "Please input Age",title: "Warning")
        }else if !(self.dogAge.text?.isNumber)!{
            self.alert(message: "Please input Age with number",title: "Warning")
        }else{
            let newDog = DogStruct()
            newDog.addDog(name: self.dogName.text!, age: Int(self.dogAge.text!)!)
            clearTextField()
        }
    }
    
    @IBAction func saveAndBackButton_Clicked(_ sender:UIButton){
        if (self.dogName.text?.characters.count)! < 3 {
            self.alert(message: "Please input Name",title: "Warning")
        }else if (self.dogAge.text?.characters.count)! <= 0{
            self.alert(message: "Please input Age",title: "Warning")
        }else if !(self.dogAge.text?.isNumber)!{
            self.alert(message: "Please input Age with number",title: "Warning")
        }else{
            let newDog = DogStruct()
            newDog.addDog(name: self.dogName.text!, age: Int(self.dogAge.text!)!)
            _ = navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func cancelButton_Clicked(_ sender: UIButton){
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
}
