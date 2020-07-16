//
//  Food.swift
//  lab3
//
//  Created by Hunter Bowman on 2/13/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation

class Food {
    
    private var name:String? = nil
    private var location:String? = nil
    private var price:UInt8? = nil
    
    init(n:String, l:String, p:UInt8) {
        self.name = n
        self.location = l
        self.price = p
    }
    
    func setName(n:String) {
        self.name = n
    }
    func getName() -> String {
        return name
    }
    
    func setLocation(l:String) {
        self.location = l
    }
    func getLocation() -> String {
        return self.location
    }
    
    func setPrice(p:UInt8) {
        self.price = p
    }
    func getPrice() -> UInt8 {
        return price
    }
    
}
