//
//  DashboardModel.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation
struct Person {
    let fullName: String
    let age: Int
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
    }
}

protocol DashboardModelLogic {
    func getData( _ completion: @escaping (Result<Bool, ServiceError>) -> ())
}

protocol DashboardDataStore {
    var person: Person? { get set}
}

class DashboardModel: DashboardModelLogic, DashboardDataStore {
	var service: DashboardServiceLogic
    var person: Person?
    
	init(_ service:  DashboardServiceLogic){
		self.service = service
	}
    
    func getData(_ completion: @escaping (Result<Bool , ServiceError>) -> ()) {
        self.service.getDataFromAPI { result in
            switch result {
            case .success(let person):
                self.person = person
                completion(.success(true))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    deinit {
           print("deinit Model")
    }
}
