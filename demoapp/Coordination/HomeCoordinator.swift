//
//  HomeCoordinator.swift
//  demoapp
//
//  Created by azerty on 14/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol HomeCoordinatorDelegate: class {
    func homeCoordinatorDidFinish(_ coordinator: HomeCoordinator)
}

// MARK:- Coordinator
final class HomeCoordinator: CoordinatorNavigable {
    // MARK:- Properties
    var navigator: NavigatorType
    weak var delegate: HomeCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var rootViewController = UINavigationController()

    init() {
        let vc = HomeViewController()
        rootViewController = UINavigationController(rootViewController: vc)
        navigator = Navigator(navigationController: rootViewController)
        vc.delegate = self
    }

    func start() {}

    func open(deepLink: Deeplinkable) {
        switch deepLink {
        case .dashboard: showDashboard()
        case .people: showPeople()
        }
    }

    func showDashboard() {
        let vc = DashboardFactory().getInitVC()
        vc.modalPresentationStyle = .fullScreen
        self.navigator.push(vc, animated: true)
    }

    func showPeople() {
        let vc = PeopleFactory().getInitVC()
        self.rootViewController.present(vc, animated: true, completion: nil)
    }
}

// MARK:- HomeVC Delegate
extension HomeCoordinator: HomeVCDelegate {
    func didTapDashboard() {
        showDashboard()
    }

    func didTapPeople() {
        showPeople()
    }

    func didTapLogout() {
        delegate?.homeCoordinatorDidFinish(self)
    }

    func didTapOnboarding() {
        let coordinator = OnboardingCoordinator()
        coordinator.delegate = self
        self.presentCoordinator(coordinator, animated: true)
    }
}

extension HomeCoordinator: OnboardingCoordinatorDelegate {
    func onboardingCoordinatorDidFinish(_ coordinator: OnboardingCoordinator) {
        self.dismissCoordinator(coordinator, animated: true)
    }
}
