//
//  AppCoordinator.swift
//  demoapp
//
//  Created by azerty on 13/06/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit

// MARK:- AppKey
struct AppKey {
    static let isLogged = "isLogged"
    static let isOnboardingViewed = "isOnboardingViewed"
}

// MARK: - Delegate
protocol AppCoordinatorDelegate: class {
    func appCoordinatorDidFinish(_ coordinator: AppCoordinator)
}

/** The application's root `Coordinator`. */
final class AppCoordinator: CoordinatorPresentable {
    // MARK:- Properties
    weak var delegate: AppCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var rootViewController = UIViewController()
    var isOnboardingViewed: Bool { UserDefaults.standard.bool(forKey: AppKey.isOnboardingViewed) }
    private var isLogged: Bool { UserDefaults.standard.bool(forKey: AppKey.isLogged) }

    // MARK:- funcs
    init(window: UIWindow) {
        rootViewController.view.backgroundColor = .white
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func start() {
        // First coordinator
        if isOnboardingViewed == false {
            showOnboarding(animated: false)
        } else if isLogged == false {
            showLogin(animated: false)
        } else {
            showHome(animated: false)
        }
    }

    func showOnboarding(animated: Bool = true) {
        let coordinator = OnboardingCoordinator()
        coordinator.delegate = self
        presentCoordinator(coordinator, animated: animated)
        coordinator.start()
    }

    func showLogin(animated: Bool = true) {
        let coordinator = LoginCoordinator()
        coordinator.delegate = self
        presentCoordinator(coordinator, animated: animated)
        coordinator.start()
    }

    func showHome(animated: Bool = true) {
        let coordinator = HomeCoordinator()
        coordinator.delegate = self
        presentCoordinator(coordinator, animated: animated)
        coordinator.start()
    }
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
    func onboardingCoordinatorDidFinish(_ coordinator: OnboardingCoordinator) {
        UserDefaults.standard.set(true, forKey: AppKey.isOnboardingViewed)
        dismissCoordinator(coordinator, animated: true)
        isLogged ? showHome() : showLogin()
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func homeCoordinatorDidFinish(_ coordinator: HomeCoordinator) {
        UserDefaults.standard.set(false, forKey: AppKey.isLogged)
        dismissCoordinator(coordinator, animated: true)
        showLogin()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func loginCoordinatorDidFinish(_ coordinator: LoginCoordinator) {
        UserDefaults.standard.set(true, forKey: AppKey.isLogged)
        dismissCoordinator(coordinator, animated: true)
        showHome()
    }
}
