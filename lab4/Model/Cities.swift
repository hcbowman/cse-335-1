//
//  Cities.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation


class Cities {
    
    var cities: [City] = []
    
    init() {
        
        cities.append(City(name: "Phoenix", imageName: "Phoenix.jpg", description: "Hot"))
        cities.append(City(name: "New York", imageName: "NewYork.jpg", description: "Too many people"))
        cities.append(City(name: "San Francisco", imageName: "SanFrancisco.jpg", description: "Silicon Valley"))
        cities.append(City(name: "Portland", imageName: "Portland.jpeg", description: "Weird"))
        cities.append(City(name: "Anchorage", imageName: "Anchorage.jpg", description: "Cold"))
        
    }
    
    func getCount() -> Int {
        return cities.count
    }
    
    func addCity(nme:String, imgNme:String, desc:String) -> City {
        let city = City(name: nme, imageName: imgNme, description: desc)
        cities.append(city)
        return city
    }
    
    func getCity(i:Int) -> City {
        return cities[i]
    }
    
    func deleteCity(i:Int) {
        cities.remove(at: i)
    }
    
}
