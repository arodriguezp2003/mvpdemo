//
//  DashboardViewController.swift
//  demoapp
//
//  Created by arodriguez on 09-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit
import FirebaseCrashlytics
protocol DashboardViewLogic: class {
    func presentData(_ person: PersonEntity)
    func errorMessage(_ message: String)
}

class DashboardViewController: UIViewController {
	var presenter: DashboardPresenterLogic
    @IBOutlet weak var xName: UILabel!
    
    // MARK: Object lifecycle
	init(_ presenter: DashboardPresenterLogic) {
		self.presenter = presenter
		super.init(nibName: String(describing: DashboardViewController.self),
                   bundle: Bundle(for: DashboardViewController.classForCoder()))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
        self.presenter.getData()
	}
    @IBAction func didTapDismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    deinit {
        print("deinit VC")
    }
}
extension DashboardViewController: DashboardViewLogic {

    func presentData(_ person: PersonEntity) {
        DispatchQueue.main.async {
            self.xName.text = person.fullName
        }
    }

    func errorMessage(_ message: String) {
        DispatchQueue.main.async {
            self.alertError(title: "Ups", message: message) {}
        }
    }
}
