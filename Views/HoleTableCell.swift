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
    
    
//    MARK: Tried to add a done button to the top of the keyboard
//    func setupTextFields() {
//        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: (self.superview?.frame.width)!, height: 30)))
//        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
//
//        toolbar.setItems([flexSpace, doneButton], animated: false)
//        toolbar.sizeToFit()
//    }
//
//    @objc func doneButtonPressed() {
//        self.superview?.endEditing(true)
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(numberHole: Int) {
        holeLabel.text = "Hole: \(numberHole)"
    }
    
}
