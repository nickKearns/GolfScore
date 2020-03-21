//
//  HomeVC.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/19/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit


class HomeVC: UIViewController {
    
    
    let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "logo")
        return logoImage
    }()
    
    let newRoundButton: UIButton = {
        let newRoundButton = UIButton()
        newRoundButton.translatesAutoresizingMaskIntoConstraints = false
        newRoundButton.setTitle("New Round", for: .normal)
        newRoundButton.layer.cornerRadius = 10
        newRoundButton.layer.borderWidth = 2
        newRoundButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        newRoundButton.setTitleColor(.black, for: .normal)
        newRoundButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        newRoundButton.titleEdgeInsets = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
       return newRoundButton
    }()
    
    let pastRoundsButton: UIButton = {
        let pastRoundsButton = UIButton()
        pastRoundsButton.translatesAutoresizingMaskIntoConstraints = false
        pastRoundsButton.setTitle("Past Rounds", for: .normal)
        pastRoundsButton.layer.cornerRadius = 10
        pastRoundsButton.layer.borderWidth = 2
        pastRoundsButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pastRoundsButton.setTitleColor(.black, for: .normal)
        pastRoundsButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        pastRoundsButton.titleEdgeInsets = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
        return pastRoundsButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    
    func setupView() {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.6096050739, blue: 0.3671522737, alpha: 1)
        
        self.view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150),
            logoImage.widthAnchor.constraint(equalToConstant: 200),
            logoImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        self.view.addSubview(newRoundButton)
        newRoundButton.backgroundColor = #colorLiteral(red: 0.2506845593, green: 0.7617723346, blue: 0.9665134549, alpha: 1)
        NSLayoutConstraint.activate([
            newRoundButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -100),
            newRoundButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
            newRoundButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.40)
        ])
        newRoundButton.addTarget(self, action: #selector(newButtonPressed), for: .touchUpInside)
        
        self.view.addSubview(pastRoundsButton)
        pastRoundsButton.backgroundColor = #colorLiteral(red: 0.2642833591, green: 0.7614423037, blue: 0.9702764153, alpha: 1)
        NSLayoutConstraint.activate([
            pastRoundsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 100),
            pastRoundsButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
            pastRoundsButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.40)
        ])
        pastRoundsButton.addTarget(self, action: #selector(pastRoundButtonPressed), for: .touchUpInside)
        
    }
    
    
    @objc func newButtonPressed() {
//        self.view.window?.rootViewController = NewRoundVC()
        self.navigationController?.pushViewController(NewRoundVC(), animated: true)
    }
    @objc func pastRoundButtonPressed() {
        self.view.window?.rootViewController = PastRoundsVC()
    }
    
}
