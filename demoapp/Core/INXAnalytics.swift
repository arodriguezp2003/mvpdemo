//
//  INXAnalytics.swift
//  demoapp
//
//  Created by arodriguez on 10-09-20.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation
import FirebaseAnalytics
import FirebaseCrashlytics
protocol INXAnalyticsLogic {
    func setUserID(_ id: String)
    func logEvent(eventName: String, params: [String:Any])
    func reset()
    func isError(featureName: String, serviceError:ServiceError)
}

class INXAnalytics: INXAnalyticsLogic {
    static let shared: INXAnalyticsLogic = INXAnalytics()
    func setUserID(_ userID: String) {
        Analytics.setUserID(userID)
    }
    
    func logEvent(eventName: String, params: [String : Any]) {
        if eventName.count > 25 {
            return
        }
        Analytics.logEvent(eventName, parameters: params)
    }
    
    func reset() {
        Analytics.resetAnalyticsData()
    }
    
    func isError(featureName: String, serviceError:ServiceError) {
        
        let reason = "responseCode: \(serviceError.responseCode) message: \(serviceError.message)"
        Crashlytics.crashlytics().record(exceptionModel: ExceptionModel(name: featureName, reason: reason))
    }
}
