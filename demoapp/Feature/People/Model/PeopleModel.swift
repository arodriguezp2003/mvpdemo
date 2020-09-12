//
//  PeopleModel.swift
//  demoapp
//
//  Created by arodriguez on 12-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation

protocol PeopleModelLogic {
     func getData( _ completion: @escaping (Result<Bool, ServiceError>) -> ())
}

protocol PeopleDataStore {
    var people: [PersonEntity] { get }
}

class PeopleModel: PeopleModelLogic, PeopleDataStore {
	var service: PeopleServiceLogic
    var people: [PersonEntity] = []

	init(_ service:  PeopleServiceLogic){
		self.service = service
	}

    func getData( _ completion: @escaping (Result<Bool, ServiceError>) -> ()) {
        self.service.getDataFromAPI { result in
            switch result {
            case .success(let people):
                self.people = people
                completion(.success(true))
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
