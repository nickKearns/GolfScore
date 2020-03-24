//
//  ViewController.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/17/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class NewRoundVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var numberOfHoles: Int = 9
    
    var courseName: String = ""
    
    var totalScore: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(self.totalScore)"
        }
    }
    
    var parTotal: Int = 0 {
        didSet {
            parLabel.text = "Par: \(self.parTotal)"
        }
    }
    
    
//    let footerText: UILabel = {
//        let footerText = UILabel()
//        footerText.translatesAutoresizingMaskIntoConstraints = false
//        footerText.textAlignment = .center
//        footerText.text = "Par: 0   Score: 0"
//        return footerText
//    }()
    
    
    let scoresTable: UITableView = {
        let scoresTable = UITableView()
        scoresTable.translatesAutoresizingMaskIntoConstraints = false
        scoresTable.rowHeight = 75
        scoresTable.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return scoresTable
    }()
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = .systemFont(ofSize: 30)
        scoreLabel.text = "Score: 0"
        return scoreLabel
    }()
    
    let parLabel: UILabel = {
        let parLabel = UILabel()
        parLabel.translatesAutoresizingMaskIntoConstraints = false
        parLabel.font = .systemFont(ofSize: 30)
        parLabel.text = "Par: 0"
        return parLabel
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupNavBar()
        self.navigationController?.isNavigationBarHidden = false
        hideKeyboardTapped()
    }
    
    
    
    func setupTable() {
        self.view.addSubview(scoresTable)
        NSLayoutConstraint.activate([
            scoresTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scoresTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scoresTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scoresTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
        scoresTable.delegate = self
        scoresTable.dataSource = self
        scoresTable.keyboardDismissMode = .onDrag
        
        scoresTable.register(UINib(nibName: "HoleTableCell", bundle: nil), forCellReuseIdentifier: "HoleTableCell")
        
        self.view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70),
            scoreLabel.bottomAnchor.constraint(equalTo: scoresTable.bottomAnchor, constant: -10),
        ])
//        self.view.bringSubviewToFront(scoreLabel)
        
        self.view.addSubview(parLabel)
        NSLayoutConstraint.activate([
            parLabel.centerXAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            parLabel.bottomAnchor.constraint(equalTo: scoresTable.bottomAnchor, constant: -10)
        ])
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.textColor = .black
        headerText.adjustsFontSizeToFitWidth = true
        headerText.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        headerText.text = courseName
        headerText.textAlignment = .center
        
        return headerText
    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.numberOfHoles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: HoleTableCell.identifier, for: indexPath) as! HoleTableCell
        cell.delegate = self
        cell.configure(numberHole: indexPath.row + 1)
        return cell
    }
    
    
    
    func setupNavBar() {
        title = "Golf Score"
        let addButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pressRoundDone))
        navigationItem.rightBarButtonItem = addButton
    }
    @objc func pressRoundDone(_ sender: UIBarButtonItem) {
        var persistenceLayer = PersistenceLayer()
        persistenceLayer.createNewRound(parScore: self.parTotal, numberOfHoles: self.numberOfHoles, userScore: self.totalScore, courseName: self.courseName)
        let finishedRoundVC = FinishedRound()
        finishedRoundVC.parTotal = self.parTotal
        finishedRoundVC.scoreTotal = self.totalScore
        finishedRoundVC.courseName = self.courseName
        self.navigationController?.pushViewController(finishedRoundVC, animated: true)
        
    }
    
    
    
    
}


