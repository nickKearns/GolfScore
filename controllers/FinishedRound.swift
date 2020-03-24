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
    
    var courseName: String = "" {
        didSet {
            courseLabel.text = "Course: \(self.courseName)"
        }
    }
    
    let finishedLabel: UILabel = {
        let finishedLabel = UILabel()
        finishedLabel.translatesAutoresizingMaskIntoConstraints = false
        finishedLabel.text = "Your Finished Round"
        finishedLabel.layer.cornerRadius = 10
        finishedLabel.font = .systemFont(ofSize: 45)
        finishedLabel.textAlignment = .center
        
        return finishedLabel
    }()
    
    
    let parLabel: UILabel = {
        let parLabel = UILabel()
        parLabel.translatesAutoresizingMaskIntoConstraints = false
        parLabel.text = "Course Par:"
        parLabel.layer.cornerRadius = 10
        parLabel.font = .systemFont(ofSize: 25)
        parLabel.textAlignment = .center
        return parLabel
    }()
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Your Score:"
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.font = .systemFont(ofSize: 25)
        scoreLabel.textAlignment = .center
        return scoreLabel
    }()
    
    let courseLabel: UILabel = {
        let courseLabel = UILabel()
        courseLabel.translatesAutoresizingMaskIntoConstraints = false
        courseLabel.text = "Course: "
        courseLabel.layer.cornerRadius = 10
        courseLabel.font = .systemFont(ofSize: 25)
        courseLabel.textAlignment = .center
        return courseLabel
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLabels()
        
        
    }
    
    func setupLabels() {
        self.view.addSubview(finishedLabel)
        NSLayoutConstraint.activate([
            finishedLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            finishedLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150)
        
        ])
        
       
        
        self.view.addSubview(courseLabel)
        NSLayoutConstraint.activate([
            courseLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            courseLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        
        ])
        
        self.view.addSubview(parLabel)
               NSLayoutConstraint.activate([
                   parLabel.topAnchor.constraint(equalTo: courseLabel.bottomAnchor, constant: 75),
                   parLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -100)
               
               ])
               
               self.view.addSubview(scoreLabel)
               NSLayoutConstraint.activate([
                   scoreLabel.topAnchor.constraint(equalTo: courseLabel.bottomAnchor, constant: 75),
                   scoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 100)
               
               ])
    }
    
}
