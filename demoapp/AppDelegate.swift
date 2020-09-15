//
//  AppDelegate.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit
import Firebase
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK:- Properties
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        FirebaseApp.configure()
        //appCoordinator?.open(deepLink: .dashboard)
        return true
    }
}

