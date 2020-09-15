//
//  HomeViewController.swift
//  demoapp
//
//  Created by azerty on 14/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

protocol HomeVCDelegate: class {
    func didTapDashboard()
    func didTapPeople()
    func didTapLogout()
    func didTapOnboarding()
}

class HomeViewController: UIViewController {
    // MARK:- Properties
    weak var delegate: HomeVCDelegate?
    
    @IBAction func didTapDashboard(_ sender: Any) {
        delegate?.didTapDashboard()
    }

    @IBAction func didTapPeople(_ sender: Any) {
        delegate?.didTapPeople()
    }

    @IBAction func logOut(_ sender: Any) {
        delegate?.didTapLogout()
    }

    @IBAction func didTapOnboarding(_ sender: Any) {
        delegate?.didTapOnboarding()
    }
}
