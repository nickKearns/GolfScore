//
//  RoundCard.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/21/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation


struct Round: Codable {
    let parScore: Int
    let numberOfHoles: Int
    let userScore: Int
    let courseName: String
    
    init(parScore: Int, numberOfHoles: Int, userScore: Int, courseName:String) {
        self.parScore = parScore
        self.numberOfHoles = numberOfHoles
        self.userScore = userScore
        self.courseName = courseName
    }
    
    
}
