//
//  LoginCoordinator.swift
//  demoapp
//
//  Created by azerty on 15/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

// MARK:- LoginCoordinatorDelegate
protocol LoginCoordinatorDelegate: class {
    func loginCoordinatorDidFinish(_ coordinator: LoginCoordinator)
}

// MARK:- LoginCoordinator
final class LoginCoordinator: CoordinatorNavigable {
    // MARK:- Properties
    var navigator: NavigatorType
    var childCoordinators: [Coordinator] = []
    var rootViewController: UINavigationController
    weak var delegate: LoginCoordinatorDelegate?

    // MARK:- init
    init() {
        let vc = LoginVC()
        rootViewController = UINavigationController(rootViewController: vc)
        navigator = Navigator(navigationController: rootViewController)
        vc.delegate = self
    }

    // MARK:- funcs
    func start() {}
}

extension LoginCoordinator: LoginVCDelegate {
    func loginDidTap() {
        delegate?.loginCoordinatorDidFinish(self)
    }
}
