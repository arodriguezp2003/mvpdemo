//
//  DashboardService.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

protocol DashboardServiceLogic: class {
    func getDataFromAPI(_ completion: @escaping (Result<PersonEntity, ServiceError>) -> () )
}

class DashboardService: DashboardServiceLogic {
    let db: Firestore
    
    init() {
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }

    func getDataFromAPI(_ completion: @escaping (Result<PersonEntity, ServiceError>) -> ()) {
        db.collection("people").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(ServiceError(responseCode: "-1", message: err.localizedDescription)))
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if let fullname = data["fullName"] as? String, let age = data["age"] as? Int {
                        let person = PersonEntity(fullName: fullname, age: age)
                        completion(.success(person))
                        return
                    }
                }
                completion(.failure(ServiceError(responseCode: "1", message: "No hay registros disponibles")))
            }
        }
    }
}
