//
//  Entities.swift
//  demoapp
//
//  Created by arodriguez on 10-09-20.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation

struct ServiceError: Error {
    let responseCode: String
    let message: String
    
    init(responseCode: String, message: String) {
        self.responseCode = responseCode
        self.message = message
    }
}
