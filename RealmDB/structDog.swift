//
//  structDog.swift
//  RealmDB
//
//  Created by Atnlie on 2/3/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import Foundation
import RealmSwift

struct DogStruct {
    var name = ""
    var age = 0
    var owner = Person()
    
    init() {
    }
    
    init(name:String, age: Int){
        self.name = name
        self.age = age
    }
    
    init(name:String, age: Int, owner: Person){
        self.name = name
        self.age = age
        self.owner = owner
    }
    
    func addDog(){
        let dog = Dog()
        dog.name = self.name
        dog.age = self.age
        dog.owner = self.owner
        let realm = try! Realm()
        try! realm.write {
            realm.add(dog)
        }
    }
    
    func addDog(name:String, age: Int){
        let dog = Dog()
        dog.name = name
        dog.age = age
        dog.owner = self.owner
        let realm = try! Realm()
        try! realm.write {
            realm.add(dog)
        }
    }
}
