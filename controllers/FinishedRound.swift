//
//  FinishedRound.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/21/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class FinishedRound: UIViewController {
    
    let finishedLabel: UILabel = {
        let finishedLabel = UILabel()
        finishedLabel.translatesAutoresizingMaskIntoConstraints = false
        finishedLabel.text = "Your Finished Round"
        finishedLabel.textAlignment = .center
        return finishedLabel
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        
    }
    
    func setupLabels() {
        self.view.addSubview(finishedLabel)
        NSLayoutConstraint.activate([
            finishedLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            finishedLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 0.50)
            
        
        
        
        ])
        
    }
    
}
