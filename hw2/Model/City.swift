//
//  City.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation

class City {
    
    private var name:String
    private var imageName:String
    private var description:String
    private var visited:Bool
    
    
    //MARK: Constructor
    init(name:String, imageName:String, description:String) {
        self.name = name
        self.imageName = imageName
        self.description = description
        self.visited = false
    }
    
    //MARK: Methods
    func setName(name:String) {
        self.name = name
    }
    func getName() -> String {
        return self.name
    }
    
    func setImageName(imageName:String) {
        self.imageName = imageName
    }
    func getImageName() -> String {
        return self.imageName
    }
    
    func setDescription(description:String) {
        self.description = description
    }
    func getDescription() -> String {
        return self.description
    }
    
    func setVisited(visited: Bool) {
        self.visited = visited
    }
    func getVisited() -> Bool {
        return self.visited
    }
    
    
}
