//
//  DogModel.swift
//  RealmDB
//
//  Created by Atnlie on 2/3/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import Foundation
import RealmSwift

class DogModel : NSObject{
    init(newDog : Dog) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(newDog)
        }
    }
}
