//
//  PeoplePresenter.swift
//  demoapp
//
//  Created by arodriguez on 12-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation


protocol PeoplePresenterLogic {
    func getData()
    func getPeople() -> [PersonEntity]
}

class PeoplePresenter: PeoplePresenterLogic {

	weak var view: PeopleViewLogic?
	var model: (PeopleModelLogic & PeopleDataStore)
	var analytics: PeopleAnalyticsLogic

	init(_ model: (PeopleModelLogic & PeopleDataStore), _ analytics: PeopleAnalyticsLogic) {
		self.model = model
		self.analytics = analytics
	}
    
    func getData() {
        self.model.getData { [weak self] (result) in
            guard let self = self, let view = self.view else {
                return
            }
            switch result {
            case .success(_):
                view.presentData()
            case.failure(let error):
                view.errorMessage(error.message)
                break
            }
        }
    }
    
    func getPeople() -> [PersonEntity] {
        return self.model.people
    }
    
}
