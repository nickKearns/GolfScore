//
//  PastRoundsVC.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/19/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class PastRoundsVC: UITableViewController {
    
    private var persistenceLayer = PersistenceLayer()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        tableView.register(
            RoundTableViewCell.nib,
            forCellReuseIdentifier: RoundTableViewCell.identifier
        )
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        persistenceLayer.setNeedsToReloadRounds()
        tableView.reloadData()

    }
    
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persistenceLayer.rounds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoundTableViewCell.identifier, for: indexPath) as! RoundTableViewCell
        let round = persistenceLayer.rounds[indexPath.row]
        cell.configure(course: round.courseName, par: round.parScore, score: round.userScore)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            
            // handling the delete action
            let roundToDelete = persistenceLayer.rounds[indexPath.row]
            let roundIndexToDelete = indexPath.row
            let deleteAlert = UIAlertController(courseName: roundToDelete.courseName) {
                self.persistenceLayer.delete(roundIndexToDelete)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            self.present(deleteAlert, animated: true)
            
            
        default:
            break
        }
    }
    
    func setupNavBar() {
        title = "Past Rounds"
        navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
}


extension UIAlertController {
    convenience init(courseName: String, confirmHandler: @escaping () -> Void) {
        self.init(title: "Delete Round", message: "Are you sure you want to delete this \(courseName) round?", preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: "confirm?", style: .destructive) { _ in
            confirmHandler()
        }
        self.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "cancel?", style: .cancel)
        self.addAction(cancelAction    )
    }
}
