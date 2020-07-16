//
//  Game.swift
//  hw1
//
//  Created by Hunter Bowman on 3/7/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation

class Game {
    
    private var symptomTable: [String: Int] = ["Headache": 0,
                                         "Pressure Head": 0,
                                         "Neck Pain": 0,
                                         "Nausea": 0,
                                         "Dizzines": 0,
                                         "Blurry Vision": 0,
                                         "Balance Prob": 0,
                                         "Light Sensitive": 0,
                                         "Sound Sensitive": 0,
                                         "Feeling Slow": 0]
    
    init() {
        
    }
    
    func addPain(symptom: String, pain: Int) {
        symptomTable.updateValue(pain, forKey: symptom)
    }
    func setPain(symptomTable: [String: Int]) {
        self.symptomTable = symptomTable
    }
    
    func totalSymptoms() -> Int {
        let count: Int = 0
        
        // TODO: get count
        
        
        return count
    }
    
    func severityScore() -> Int {
        // TODO: get score
        
        return 0
    }
    
    func printD() -> String {
        var s: String = ""
        
        for (k, i) in symptomTable {
            s = (k + ":" + String(i) + "\n")
        }
        
        return s
    }
    
    
}
