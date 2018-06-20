//
//  ClassementTableViewCell.swift
//  footballApi
//
//  Created by Ernesto Yah Lopez on 20/06/2018.
//  Copyright © 2018 UGA.yah.william. All rights reserved.
//

import UIKit

class ClassementTableViewCell: UITableViewCell {
    @IBOutlet weak var no: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var MJ: UILabel!
    @IBOutlet weak var points: UILabel!
    
    @IBOutlet weak var buts: UILabel!
    @IBOutlet weak var butsC: UILabel!
    @IBOutlet weak var difference: UILabel!
    @IBOutlet weak var MG: UILabel!
    @IBOutlet weak var MN: UILabel!
    @IBOutlet weak var MP: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
