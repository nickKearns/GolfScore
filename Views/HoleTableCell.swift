//
//  HoleTableCell.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/18/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class HoleTableCell: UITableViewCell, UITextFieldDelegate {

    static var identifier: String = "HoleTableCell"
    
    var delegate: NewRoundVC?
    
    

    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var parTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        scoreTextField.delegate = self
        parTextField.delegate = self
        self.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let totalScore = delegate?.totalScore
        let cellScore = Int(self.scoreTextField.text ?? "0")
        
        delegate?.totalScore = (totalScore ?? 0) + (cellScore ?? 0)
        
        let totalPar = delegate?.parTotal
        let cellPar = Int(self.parTextField.text ?? "0")
        
        delegate?.parTotal = (totalPar ?? 0) + (cellPar ?? 0)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let totalScore = delegate?.totalScore
        let scoreToSubtract = Int(self.scoreTextField.text ?? "0")
        
        delegate?.totalScore = (totalScore ?? 0) - (scoreToSubtract ?? 0)
        
        let totalPar = delegate?.parTotal
        let parToSubtract = Int(self.parTextField.text ?? "0")
        
        delegate?.parTotal = (totalPar ?? 0) - (parToSubtract ?? 0)
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(numberHole: Int) {
        holeLabel.text = "Hole: \(numberHole)"
    }
    
}
