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
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        if numberHole % 2 == 0 {
            backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
    }
    
}

