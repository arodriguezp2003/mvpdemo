//
//  LoginVC.swift
//  demoapp
//
//  Created by azerty on 15/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

// MARK:- LoginVCDelegate
protocol LoginVCDelegate: class {
    func loginDidTap()
}

// MARK:- LoginVC
final class LoginVC: UIViewController {
    // MARK:- Properties
    weak var delegate: LoginVCDelegate?

    // MARK:- Login
    @IBAction func Login(_ sender: Any) {
        delegate?.loginDidTap()
    }
}
