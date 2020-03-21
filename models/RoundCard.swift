//
//  RoundCard.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/21/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation


struct Round {
    let parScore: Int
    let numberOfHoles: Int
    let userScore: Int
    
    init(parScore: Int, numberOfHoles: Int, userScore: Int) {
        self.parScore = parScore
        self.numberOfHoles = numberOfHoles
        self.userScore = userScore
    }
    
    
}
