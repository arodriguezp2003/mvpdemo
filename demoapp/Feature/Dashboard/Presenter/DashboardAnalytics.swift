//
//  DashboardAnalytics.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation



protocol DashboardAnalyticsLogic {
    func eventLoadVC()
    func eventLoadDataOK()
    func eventLoadDataError(_ serviceError: ServiceError )
}

class DashboardAnalytics: DashboardAnalyticsLogic {
    func eventLoadVC() {
        INXAnalytics.shared.logEvent(eventName: "Dashboard", params: ["loadVC" : "OK"])
    }
    
    func eventLoadDataOK() {
        INXAnalytics.shared.logEvent(eventName: "Dashboard", params: ["loadData" : "OK"])
    }
    
    func eventLoadDataError(_ serviceError: ServiceError ) {
        
        let params = [
            "loadData": "Error",
            "responseCode": serviceError.responseCode,
            "message": serviceError.message
        ]
        
        INXAnalytics.shared.logEvent(eventName: "Dashboard", params: params)
        INXAnalytics.shared.isError(featureName: "Dashboard", serviceError: serviceError)
    }
}
