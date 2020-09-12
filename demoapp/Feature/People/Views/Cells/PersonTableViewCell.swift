//
//  PersonTableViewCell.swift
//  demoapp
//
//  Created by arodriguez on 12-09-20.
//  Copyright © 2020 cl.mvp.prueba. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var xName: UILabel!
    @IBOutlet weak var xAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ person: PersonEntity) {
        self.xName.text = person.fullName
        self.xAge.text = "Tiene \(person.age) años"
    }
    
}
