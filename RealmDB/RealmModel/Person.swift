//
//  Person.swift
//  RealmDB
//
//  Created by Atnlie on 2/2/17.
//  Copyright © 2017 Atnlie. All rights reserved.
//

import Foundation
import RealmSwift

class Person : Object{
    dynamic var name = ""
    dynamic var age = 0
    dynamic var sex = ""
    let dog = List<Dog>()
}
