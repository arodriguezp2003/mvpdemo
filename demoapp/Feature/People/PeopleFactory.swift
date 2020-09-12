//
//  PeopleFactory.swift
//  demoapp
//
//  Created by arodriguez on 12-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation
import UIKit
class PeopleFactory {

    func getInitVC() -> UIViewController {
        let service = PeopleService()
        let model = PeopleModel(service)
        let analytics = PeopleAnalytics()
        let presenter = PeoplePresenter(model, analytics)
        let viewController = PeopleViewController(presenter)

        presenter.view = viewController
        return viewController
    }

}