//
//  DashboardPresenter.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation


protocol DashboardPresenterLogic {
    func getData()
}

class DashboardPresenter: DashboardPresenterLogic {

	weak var view: DashboardViewLogic?
	var model: (DashboardModelLogic & DashboardDataStore)
	var analytics: DashboardAnalyticsLogic

	init(_ model: (DashboardModelLogic & DashboardDataStore), _ analytics: DashboardAnalyticsLogic) {
		self.model = model
		self.analytics = analytics
	}
    
    func getData() {
        self.model.getData { [weak self] (result) in
            guard let self = self else {return}

            switch result {
            case .success(_):
                guard let person = self.model.person else {
                    return
                }
                self.view?.loadData(person)
            case .failure(let err):
                self.view?.errorData(err.message)
            }
        }
    }
    deinit {
        print("deinit presenter")
    }
}
