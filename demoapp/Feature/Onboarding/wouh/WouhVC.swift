//
//  WouhVC.swift
//  demoapp
//
//  Created by azerty on 15/09/2020.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

// MARK:- WouhVCDelegate
protocol WouhVCDelegate: class {
    func fiouhDidTap()
    func finishDidTap()
}

// MARK:- WOUHVC
final class WouhVC: UIViewController {
    // Properties
    weak var delegate: WouhVCDelegate?

    // MARK:- IBActions
    @IBAction func fiouhDidTap(_ sender: Any) {
        delegate?.fiouhDidTap()
    }

    @IBAction func finishDidTap(_ sender: Any) {
        delegate?.finishDidTap()
    }
}
