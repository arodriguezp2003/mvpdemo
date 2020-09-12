//
//  ViewController.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    

    @IBAction func didTapDashboard(_ sender: Any) {
        let vc = DashboardFactory().getInitVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didTapPeople(_ sender: Any) {
        let vc = PeopleFactory().getInitVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

