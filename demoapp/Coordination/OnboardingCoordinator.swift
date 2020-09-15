//
//  OnboardingCoordinator.swift
//  demoapp
//
//  Created by azerty on 15/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

// MARK:- Delegate
protocol OnboardingCoordinatorDelegate: class {
    func onboardingCoordinatorDidFinish(_ coordinator: OnboardingCoordinator)
}


// MARK:- Coordinator
final class OnboardingCoordinator: CoordinatorNavigable {
    // MARK:- Properties
    var navigator: NavigatorType
    var childCoordinators: [Coordinator] = []
    var rootViewController: UINavigationController
    weak var delegate: OnboardingCoordinatorDelegate?

    // MARK:- Init
    init() {
        let vc = FiouhVC()
        rootViewController = UINavigationController(rootViewController: vc)
        navigator = Navigator(navigationController: rootViewController)
        vc.delegate = self
    }

    // MARK:- Funcs
    func start() {}
}

extension OnboardingCoordinator: FiouhVCDelegate {
    func wawDidTap() {
        let vc = WawVC()
        vc.delegate = self
        self.navigator.push(vc, animated: true)
    }

    func finishDidTap() {
        delegate?.onboardingCoordinatorDidFinish(self)
    }
}

extension OnboardingCoordinator: WawVCDelegate {
    func wouhDidTap() {
        let vc = WouhVC()
        vc.delegate = self
        self.navigator.push(vc, animated: true)
    }
}

extension OnboardingCoordinator: WouhVCDelegate {
    func fiouhDidTap() {
        let vc = FiouhVC()
        vc.delegate = self
        self.navigator.push(vc, animated: true)
    }
}
