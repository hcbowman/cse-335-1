//
//  Games.swift
//  hw1
//
//  Created by Hunter Bowman on 3/7/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation

class Games {
    
    private var gamesArray: [Game] = []
    private var gameCurrent: Game
    
    init() {
        self.gameCurrent = Game()
    }
    
    func addGame() {
        self.gamesArray.append(gameCurrent)
        self.gameCurrent = Game()
        print("Games class, addGame()")
    }
    
    func updatePainSym(symptom: String, pain: Int) {
        gameCurrent.addPain(symptom: symptom, pain: pain)
    }
    
    func gameNumber() -> Int {
        return gamesAdded()
    }
    
    func gamesAdded() -> Int {
        return Int(gamesArray.count)
    }
    
    func clearGames() {
        gamesArray.removeAll()
    }
    
    func printTableByIndex(index: Int) -> String {
        return gamesArray[(index-1)].printD()
    }
    
    
}
