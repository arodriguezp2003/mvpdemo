//
//  UIViewController+Ext.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func alertError(title: String, message: String, _ action: @escaping ()->()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let btn = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            action()
        }
        alert.addAction(btn)
        self.present(alert, animated: true, completion: nil)
    }
}
