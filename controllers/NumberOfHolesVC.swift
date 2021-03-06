//
//  numberOfHolesVC.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/21/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation
import UIKit


class NumberOfHolesVC: UIViewController {
    
    
    
    let numHolesLabel: UILabel = {
        let numHolesLabel = UILabel()
        numHolesLabel.translatesAutoresizingMaskIntoConstraints = false
        numHolesLabel.text = "How many holes will you be playing?"
        numHolesLabel.lineBreakMode = .byWordWrapping
        numHolesLabel.numberOfLines = 3
        numHolesLabel.textAlignment = .center
        numHolesLabel.font = numHolesLabel.font.withSize(35)
        return numHolesLabel
    }()
    
    let nineHolesButton: UIButton = {
        let nineHolesButton = UIButton()
        nineHolesButton.translatesAutoresizingMaskIntoConstraints = false
        nineHolesButton.setTitle("9 Holes", for: .normal)
        nineHolesButton.setTitleColor( .black, for: .normal)
        nineHolesButton.titleLabel?.font = .systemFont(ofSize: 20)
        nineHolesButton.layer.cornerRadius = 10
        nineHolesButton.layer.borderWidth = 3
        nineHolesButton.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        nineHolesButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return nineHolesButton
    }()
    
    let eighteenHolesButton: UIButton = {
        let eighteenHolesButton = UIButton()
        eighteenHolesButton.translatesAutoresizingMaskIntoConstraints = false
        eighteenHolesButton.setTitle("18 Holes", for: .normal)
        eighteenHolesButton.setTitleColor(.black, for: .normal)
        eighteenHolesButton.titleLabel?.font = .systemFont(ofSize: 20)
        eighteenHolesButton.layer.cornerRadius = 10
        eighteenHolesButton.layer.borderWidth = 3
        eighteenHolesButton.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        eighteenHolesButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return eighteenHolesButton
        
    }()
    
    let courseNameTextField: UITextField = {
        let courseNameTextField = UITextField()
        courseNameTextField.translatesAutoresizingMaskIntoConstraints = false
        courseNameTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        courseNameTextField.placeholder = "Course Name"
        courseNameTextField.layer.cornerRadius = 10
        courseNameTextField.font = .systemFont(ofSize: 45)
        courseNameTextField.layer.borderWidth = 3
        courseNameTextField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return courseNameTextField
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        setupLabel()
        setupButtons()
        setupTextField()
        hideKeyboardTapped()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    func setupLabel() {
        self.view.addSubview(numHolesLabel)
        NSLayoutConstraint.activate([
            numHolesLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            numHolesLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150),
            numHolesLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75)
        
        ])
    }
    
    func setupButtons()  {
        self.view.addSubview(nineHolesButton)
        NSLayoutConstraint.activate([
            nineHolesButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -100),
            nineHolesButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
            nineHolesButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.40)
        ])
        nineHolesButton.addTarget(self, action: #selector(nineButtonPressed), for: .touchUpInside)

        
        self.view.addSubview(eighteenHolesButton)
        NSLayoutConstraint.activate([
            eighteenHolesButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 100),
            eighteenHolesButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
            eighteenHolesButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.40)
        ])
        eighteenHolesButton.addTarget(self, action: #selector(eighteenButtonPressed), for: .touchUpInside)
        
    }
    
    func setupTextField() {
        self.view.addSubview(courseNameTextField)
        NSLayoutConstraint.activate([
            courseNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            courseNameTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func nineButtonPressed() {
        let newRoundVC = NewRoundVC()
        newRoundVC.numberOfHoles = 9
        newRoundVC.courseName = self.courseNameTextField.text ?? ""
        self.navigationController?.pushViewController(newRoundVC, animated: true)
    }
    @objc func eighteenButtonPressed() {
        let newRoundVC = NewRoundVC()
        newRoundVC.numberOfHoles = 18
        newRoundVC.courseName = self.courseNameTextField.text ?? ""
        self.navigationController?.pushViewController(newRoundVC, animated: true)
    }
    
    
}


