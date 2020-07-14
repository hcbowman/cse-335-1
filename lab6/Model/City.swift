//
//  City.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation

class City {
    
    var name:String
    var imageName:String
    var description:String
    
    //MARK: Constructor
    init(name:String, imageName:String, description:String) {
        self.name = name
        self.imageName = imageName
        self.description = description
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
    
    
}
