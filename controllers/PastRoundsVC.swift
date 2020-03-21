//
//  PastRoundsVC.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/19/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class PastRoundsVC: UIViewController {
    
    
    
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
   
    
    
    func setupTable() {
        self.view.addSubview(roundsTable)
        NSLayoutConstraint.activate([
            roundsTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            roundsTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            roundsTable.topAnchor.constraint(equalTo: self.view.topAnchor),
            roundsTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>)
//    }
}
