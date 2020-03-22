//
//  PersistenceLayer.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/22/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation


struct PersistenceLayer {
    
    private(set) var rounds: [Round] = []
    
    
    private static let userDefaultsRoundsKeyValue =  "ROUNDS_ARRAY"
    
    init() {
        self.loadRounds()
    }
    
    private mutating func loadRounds() {
        let userDefaults = UserDefaults.standard
        
        guard
            let roundData = userDefaults.data(forKey: PersistenceLayer.userDefaultsRoundsKeyValue),
            let rounds = try? JSONDecoder().decode([Round].self, from: roundData) else {
                return
        }
        self.rounds = rounds
        
    }
    
    private func saveHabits() {
           guard let roundData = try? JSONEncoder().encode(self.rounds) else {
               fatalError("could not encode list of rounds")
           }
           
           let userDefaults = UserDefaults.standard
           userDefaults.set(roundData, forKey: PersistenceLayer.userDefaultsRoundsKeyValue)
           userDefaults.synchronize()
       }
    
    mutating func delete(_ roundIndex: Int) {
        self.rounds.remove(at: roundIndex)
        self.saveHabits()
    }
    
    
    mutating func setNeedsToReloadHabits() {
        self.loadRounds()
    }
    
    @discardableResult
    mutating func createNewRound(parScore: Int, numberOfHoles: Int, userScore: Int) -> Round {
        
        let newRound = Round(parScore: parScore, numberOfHoles: numberOfHoles, userScore: userScore)
        self.rounds.insert(newRound, at: 0)
        self.saveHabits()
        return newRound
    }
    
    
}
