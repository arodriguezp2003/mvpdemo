//
//  PeopleEntity.swift
//  demoapp
//
//  Created by arodriguez on 12-09-20.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation

struct PersonEntity {
    let fullName: String
    let age: Int
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
    }
}
