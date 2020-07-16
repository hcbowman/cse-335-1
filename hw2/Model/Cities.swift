//
//  Cities.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation


class Cities {
    
    private var cities: [City] = []
    //private var alphabeticalSectionsDict: [String: Int] = [:]
    private var citiesDict: [String: [City]] = [:]
    private var citiesTitles: [String] = []
    
    
    init() {
        
        cities.append(City(name: "Phoenix, AZ", imageName: "Phoenix.jpg", description: "Hot"))
        cities.append(City(name: "New York", imageName: "NewYork.jpg", description: "Too many people"))
        cities.append(City(name: "San Francisco", imageName: "SanFrancisco.jpg", description: "Silicon Valley"))
        cities.append(City(name: "Portland", imageName: "Portland.jpeg", description: "Weird"))
        cities.append(City(name: "Anchorage", imageName: "Anchorage.jpg", description: "Cold"))
        
        initDict()
        
        //initSections()
        
    }
    
    func getCityCount() -> Int {
        return cities.count
    }
    
    func getNumOfSections() -> Int {
        //return alphabeticalSectionsDict.count
        return citiesTitles.count
    }
    
    func getNumOfRowsInSection(section: Int) -> Int {
       // var str: [String] = []
        
        //for ele in alphabeticalSectionsDict{
        //    str.append(ele.key)
        //}
        //return str.sorted()[section].count
        
        let citKey = citiesTitles[section]
        if let citValues = citiesDict[citKey] {
            return citValues.count
        }
            
        return 0
    }
    
    func getKey(section: Int) -> String {
        return citiesTitles[section]
    }
    
    func getKeys() -> [String] {
        return citiesTitles
    }
    
    func getCities(section: String) -> [City] {
        return citiesDict[section]!
    }
    
    /*
    func getNumOfRowsInSectionN(section: Int) -> Int {
        let i = section + 65
    
        let s = String(UnicodeScalar(UInt8(i)))
    
        if let si = alphabeticalSectionsDict.first(where: { $0.key.hasPrefix(s) }) {
            return si.value
        }
    
        return 0
    }
    
    func getKeyN(section: Int) -> String {
        let i = section + 65
        
        let s = String(UnicodeScalar(UInt8(i)))
        
        return s
    }
    
    
    func getKey(section: Int) -> String {
        var str: [String] = []
        
        for ele in alphabeticalSectionsDict{
            str.append(ele.key)
        }
        return str.sorted()[section]
        
    }
    
    func getKeys() -> [String] {
        var str: [String] = []
        
        for ele in alphabeticalSectionsDict{
            str.append(ele.key)
        }
        return str.sorted()
        
    }
    */
    
    //TODO: Fix this
    func addCity(nme: String, imgNme: String, desc: String) {
        let city = City(name: nme, imageName: imgNme, description: desc)
        let cityKey = String(city.getName().prefix(1))
        
        citiesDict[cityKey]?.append(city)
    }
    
    func getCity(i: Int) -> City {
        let title = citiesTitles[i]
        
        return citiesDict[title]![i]
    }
    
    func deleteCity(i: Int) {
        cities.remove(at: i)
        
        let title = citiesTitles[i]
        
        citiesDict[title]?.remove(at: i)
    }
    
    func initDict() {
        
            for c in cities {
                let cityKey = String(c.getName().prefix(1))
                    if var citValues = citiesDict[cityKey] {
                        citValues.append(c)
                        citiesDict[cityKey] = citValues
                    } else {
                        citiesDict[cityKey] = [c]
                    }
            }
            
            citiesTitles = [String](citiesDict.keys)
            citiesTitles = citiesTitles.sorted(by: { $0 < $1 })
    }
    
    
    //TODO: Delete this
    /*
    func initSections() {
        
        for city in cities {
            addSection(cityToAdd: city)
        }
        
    }
    
    func addSection(cityToAdd: City) {
        //let fistLetter = String(cityToAdd.getName().prefix(1))


        if var alphabeticalIndex = alphabeticalSectionsDict.first(where: { $0.key.hasPrefix(cityToAdd.getName()) }) {
            alphabeticalSectionsDict[alphabeticalIndex.key] = alphabeticalIndex.value + 1
        } else {
            alphabeticalSectionsDict[String(cityToAdd.getName().prefix(1))] = 1
        }
        
    }
    */
    
    func searchItem() -> Bool {
        return false
    }
    
}
