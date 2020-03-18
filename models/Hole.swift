//
//  Hole.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/17/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation


struct Hole {
    
    let par: Int
    let score: Int
    
    
    init(par: Int, score: Int) {
        self.par = par
        self.score = score
    }
}
