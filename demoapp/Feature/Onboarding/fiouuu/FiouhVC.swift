//
//  FiouhVC.swift
//  demoapp
//
//  Created by azerty on 15/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

// MARK:- FiouhVCDelegate
protocol FiouhVCDelegate: class {
    func wawDidTap()
    func finishDidTap()
}

// MARK:- FIOUHVC
final class FiouhVC: UIViewController {
    // MARK:- Properties
    weak var delegate: FiouhVCDelegate?

    // MARK:- IBActions
    @IBAction func wawDidTap(_ sender: Any) {
        delegate?.wawDidTap()
    }

    @IBAction func finishDidTap(_ sender: Any) {
        delegate?.finishDidTap()
    }
}
