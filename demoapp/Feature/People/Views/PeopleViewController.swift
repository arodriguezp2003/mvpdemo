//
//  PeopleViewController.swift
//  demoapp
//
//  Created by arodriguez on 12-09-20.
//  Copyright (c) 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

protocol PeopleViewLogic: class {
    func presentData()
    func errorMessage(_ message: String)
}

class PeopleViewController: UIViewController {
    var presenter: PeoplePresenterLogic
    @IBOutlet private weak var tableView: UITableView!

	// MARK: Object lifecycle
	init(_ presenter: PeoplePresenterLogic) {
		self.presenter = presenter
		super.init(nibName: String(describing: PeopleViewController.self),
                   bundle: Bundle(for: PeopleViewController.classForCoder()))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
        self.setupTableView()
        self.presenter.getData()
	}
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getPeople().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PersonTableViewCell else {
            fatalError("Cell not found")
        }
        cell.setup(self.presenter.getPeople()[indexPath.item])
        return cell
    }
    
    
}

extension PeopleViewController: PeopleViewLogic {
    func presentData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func errorMessage(_ message: String) {
        
    }
}
