//
//  PersonModel.swift
//  RealmDB
//
//  Created by Atnlie on 2/6/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import UIKit
import RealmSwift

class PersonModel: NSObject {
    override init(){
    }
    
    init(newPerson:Person) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(newPerson)
        }
    }
    
    init(name:String, age: Int, sex:String) {
        let newPerson = Person()
        newPerson.name = name
        newPerson.age = age
        newPerson.sex = sex

        let realm = try! Realm()
        try! realm.write {
            realm.add(newPerson)
        }
    }
    
    func saveData(name: String, age: Int, sex: String)-> Bool{
        let newPerson = Person()
        newPerson.name = name
        newPerson.age = age
        newPerson.sex = sex
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(newPerson)
        }
        return true
    }
}
