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
    
    let scoresTable: UITableView = {
        let scoresTable = UITableView()
        scoresTable.translatesAutoresizingMaskIntoConstraints = false
        scoresTable.rowHeight = 50
        scoresTable.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        return scoresTable
    }()
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: 0"
        return scoreLabel
    }()
    
    let parLabel: UILabel = {
        let parLabel = UILabel()
        parLabel.translatesAutoresizingMaskIntoConstraints = false
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
            scoreLabel.centerXAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            scoreLabel.heightAnchor.constraint(equalToConstant: 15),
            scoreLabel.bottomAnchor.constraint(equalTo: scoresTable.bottomAnchor, constant: -8)
        ])
        self.view.bringSubviewToFront(scoreLabel)
        
        self.view.addSubview(parLabel)
        NSLayoutConstraint.activate([
            parLabel.centerXAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            parLabel.heightAnchor.constraint(equalToConstant: 15),
            parLabel.bottomAnchor.constraint(equalTo: scoresTable.bottomAnchor, constant: -8)
        ])
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Current Round"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.textColor = .black
        headerText.adjustsFontSizeToFitWidth = true
        headerText.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        headerText.text = "Current Round"
        headerText.textAlignment = .center

        return headerText
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row")
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
        //do all persistence work here
        
    }
    
    
    
    
}


//Huge thanks to Wesley Espinoza for providing this extension

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
