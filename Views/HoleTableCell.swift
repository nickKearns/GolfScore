//
//  HoleTableCell.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/18/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class HoleTableCell: UITableViewCell {

    static var identifier: String = "HoleTableCell"
    

    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var parTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(numberHole: Int) {
        holeLabel.text = "Hole: \(numberHole)"
    }
    
}
