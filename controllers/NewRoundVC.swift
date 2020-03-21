//
//  ViewController.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/17/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class NewRoundVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var totalScore: Int = 0 {
        didSet {
            scoreLabel.text = "Total: \(self.totalScore)"
        }
    }

    let scoresTable: UITableView = {
       let scoresTable = UITableView()
       scoresTable.translatesAutoresizingMaskIntoConstraints = false
       scoresTable.rowHeight = 75
       return scoresTable
    }()
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: 0"
        return scoreLabel
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        // Do any additional setup after loading the view.
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
            scoreLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 15),
            scoreLabel.bottomAnchor.constraint(equalTo: scoresTable.bottomAnchor, constant: -8)
        ])
        self.view.bringSubviewToFront(scoreLabel)
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current Round"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row")
    }
  
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: HoleTableCell.identifier, for: indexPath) as! HoleTableCell
        cell.delegate = self
        cell.configure(numberHole: indexPath.row + 1)
        return cell
    }
    
    
    
    
}


//Huge thanks to Wesley Espinoza for providing this code snippet

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle:nil)
    }
    @objc func keyboardWillShow(notifaction: NSNotification) {
        if let keyboardSize = (notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 50
            }
        }
    }
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    func hideKeyboardTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}