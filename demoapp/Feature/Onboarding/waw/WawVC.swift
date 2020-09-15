//
//  WawVC.swift
//  demoapp
//
//  Created by azerty on 15/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

// MARK:- WawVCDelegate
protocol WawVCDelegate: class {
    func wouhDidTap()
    func finishDidTap()
}

// MARK:- WAWVC
final class WawVC: UIViewController {
    // MARK:- Properties
    weak var delegate: WawVCDelegate?

    // MARK:- IBActions
    @IBAction func wouhDidTap(_ sender: Any) {
        delegate?.wouhDidTap()
    }

    @IBAction func finishDidTap(_ sender: Any) {
        delegate?.finishDidTap()
    }
}
