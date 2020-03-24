//
//  RoundTableViewCell.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/19/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class RoundTableViewCell: UITableViewCell {
    
    static var identifier: String = "RoundTableViewCell"

    @IBOutlet weak var courseLabel: UILabel!
    
    @IBOutlet weak var parLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(course: String, par: Int, score: Int) {
        courseLabel.text = "Course: \(course)"
        parLabel.text = "Par: \(par)"
        scoreLabel.text = "Score: \(score)"
    }
    
}
