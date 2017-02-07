//
//  PersonViewModel.swift
//  RealmDB
//
//  Created by Atnlie on 2/6/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import UIKit

class PersonViewModel: UIViewController {
    func saveNewPerson(_ vc : AddPersonViewController)->Bool{
        if (vc.personName.text?.characters.count)! < 3 {
            alert(message: "Please input Name 3 characters", title: "Warning")
        }else if !(vc.personAge.text?.isNumber)! {
            alert(message: "Please input Age with number 0-9", title: "Warning")
        }else if (vc.personSex.text?.characters.count)! <= 0{
            alert(message: "Please input Sex", title: "Warning")
        }else if (vc.personDog.text?.characters.count)! < 3 {
            alert(message: "Please input Dog 3 characters", title: "Warning")
        }else{
            return PersonModel.init().saveData(name: vc.personName.text!, age: Int(vc.personAge.text!)!, sex: vc.personSex.text!)
        }
        return false
    }
}
