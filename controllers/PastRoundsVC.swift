//
//  PastRoundsVC.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/19/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class PastRoundsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var persistenceLayer = PersistenceLayer()
    
    
    let roundsTable: UITableView = {
        let roundsTable = UITableView()
        roundsTable.translatesAutoresizingMaskIntoConstraints = false
        roundsTable.rowHeight = 75
        return roundsTable
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        persistenceLayer.setNeedsToReloadRounds()
        roundsTable.reloadData()
    }
    
    
    
    func setupTable() {
        self.view.addSubview(roundsTable)
        NSLayoutConstraint.activate([
            roundsTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            roundsTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            roundsTable.topAnchor.constraint(equalTo: self.view.topAnchor),
            roundsTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        roundsTable.register(UINib(nibName: "RoundTableViewCell", bundle: nil), forCellReuseIdentifier: "RoundTableViewCell")
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persistenceLayer.rounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoundTableViewCell.identifier, for: indexPath) as! RoundTableViewCell
        let round = persistenceLayer.rounds[indexPath.row]
        cell.configure(course: round.courseName, par: round.parScore, score: round.userScore)
        return cell
    }
}
