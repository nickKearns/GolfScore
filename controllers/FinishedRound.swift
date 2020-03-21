//
//  FinishedRound.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/21/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class FinishedRound: UIViewController {
    
    var parTotal: Int = 0 {
        didSet {
            parLabel.text = "Course Par: \(self.parTotal)"
        }
    }
    var scoreTotal: Int = 0 {
        didSet {
            scoreLabel.text = "Your Score: \(self.scoreTotal)"
        }
    }
    
    let finishedLabel: UILabel = {
        let finishedLabel = UILabel()
        finishedLabel.translatesAutoresizingMaskIntoConstraints = false
        finishedLabel.text = "Your Finished Round"
        finishedLabel.layer.cornerRadius = 10
        finishedLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        finishedLabel.font = .systemFont(ofSize: 45)
        finishedLabel.textAlignment = .center
        
        return finishedLabel
    }()
    
    
    let parLabel: UILabel = {
        let parLabel = UILabel()
        parLabel.translatesAutoresizingMaskIntoConstraints = false
        parLabel.text = "Course Par:"
        parLabel.layer.cornerRadius = 10
        parLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        parLabel.font = .systemFont(ofSize: 25)
        parLabel.textAlignment = .center
        return parLabel
    }()
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Your Score:"
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        scoreLabel.font = .systemFont(ofSize: 25)
        scoreLabel.textAlignment = .center
        return scoreLabel
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        setupLabels()
        
        
    }
    
    func setupLabels() {
        self.view.addSubview(finishedLabel)
        NSLayoutConstraint.activate([
            finishedLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            finishedLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150)
        
        ])
        
        self.view.addSubview(parLabel)
        NSLayoutConstraint.activate([
            parLabel.topAnchor.constraint(equalTo: finishedLabel.bottomAnchor, constant: 75),
            parLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -100)
        
        ])
        
        self.view.addSubview(scoreLabel)
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: finishedLabel.bottomAnchor, constant: 75),
            scoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 100)
        
        ])
        
    }
    
}
