//
//  DashboardFactory.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation
import UIKit
class DashboardFactory {

    func getInitVC() -> UIViewController {
        let service = DashboardService()
        let model = DashboardModel(service)
        let analytics = DashboardAnalytics()
        let presenter = DashboardPresenter(model, analytics)
        let viewController = DashboardViewController(presenter)

        presenter.view = viewController
        return viewController
    }

}