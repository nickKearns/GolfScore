//
//  ViewController.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/17/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    let scoresTable: UITableView = {
       let scoresTable = UITableView()
       scoresTable.translatesAutoresizingMaskIntoConstraints = false
       scoresTable.rowHeight = 75
       return scoresTable
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("view loaded")
        setupTable()
        // Do any additional setup after loading the view.
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
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current Round"
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: HoleTableCell.identifier, for: indexPath) as! HoleTableCell
        cell.configure(numberHole: indexPath.row + 1)
        return cell
    }
    
}

