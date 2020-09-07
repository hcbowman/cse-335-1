//
//  CityViewModel.swift
//  Hw2Programmatic
//
//  Created by Hunter Bowman on 8/22/20.
//

import Foundation


class CityViewModel {
    
    private let persistenceManager: PersistenceManager
    
    init(coreDataPersistenceManager persistenceManager: PersistenceManager) {
        self.persistenceManager = persistenceManager
    }
    
    // Will return a count of the Cities
    func rowsTotal() -> Int {
        //return persistenceManager.total(City.self)
        return persistenceManager.
    }
    
    func loadCityTableViewCells(withDemoData choice: Bool) -> <#return type#> {
        <#function body#>
    }
    
    // MARK: - This section is for the initialization of CoreData with a JSON file.
    // FIX: The optionals need to be handled better
    private func parseCityJSON() {
        
        do {
            
            // Get and parse data from the JSON file and stuff the CityStruct object with it.
            //let rawCellData = try JSONDecoder().decode(CityStruct.self, from: citiesDictJSON)
            
            if let cellDict = try? JSONSerialization.jsonObject(with: citiesDictJSON) as? [[String : Any]] {
                persistenceManager.context.perform {
                    
                }
            }
            
            // Create, and add our city to the managedObjectContext. Then return a ref to that City object.
            let city = persistenceManager.add(City.self)!
            
            // Pass off the data from the CityStruct object "decodedData" via the reference to the City object
            city.name = rawCellDemoData.name
            city.image = rawCellDemoData.image
            city.hasVisited = rawCellDemoData.hasVisited
            city.cityDescription = rawCellDemoData.cityDescription
            
            
        } catch {
            print("decode error")
        }
    }
    
}

// MARK: - Demo Data for cityTableView cells; For showcasing the app.
let cityJSON = """
{
    "Name": "Pheonix",
    "Image": "Pheonix.jpg",
    "Has_Visited": true,
    "Description": "It's hot!"
}
""".data(using: .utf8)!

let citiesJSON = """
{
    "Cities": [
        {"Name": "Pheonix",
        "Image": "Pheonix.jpg",
        "Has_Visited": true,
        "Description": "It's hot!"},

        {"Name": "New York",
        "Image": "NewYork.jpg",
        "Has_Visited": true,
        "Description": "Too many people"},
        
        {"Name": "San Francisco",
        "Image": "SanFrancisco.jpg",
        "Has_Visited": true,
        "Description": "Silicon Valley"},

        {"Name": "Portland",
        "Image": "Portland.jpeg",
        "Has_Visited": true,
        "Description": "Weird"},

        {"Name": "Anchorage",
        "Image": "Anchorage.jpg",
        "Has_Visited": true,
        "Description": "Cold"}
    ]
}
""".data(using: .utf8)!

let citiesDictJSON = """
{
    "Cities": [
        ["Name": "Pheonix",
        "Image": "Pheonix.jpg",
        "Has_Visited": true,
        "Description": "It's hot!"],

        ["Name": "New York",
        "Image": "NewYork.jpg",
        "Has_Visited": true,
        "Description": "Too many people"],
        
        ["Name": "San Francisco",
        "Image": "SanFrancisco.jpg",
        "Has_Visited": true,
        "Description": "Silicon Valley"],

        ["Name": "Portland",
        "Image": "Portland.jpeg",
        "Has_Visited": true,
        "Description": "Weird"],

        ["Name": "Anchorage",
        "Image": "Anchorage.jpg",
        "Has_Visited": true,
        "Description": "Cold"]
    ]
}
""".data(using: .utf8)!


struct CityStruct: Codable {
    let name: String
    let image: String
    let hasVisited: Bool
    let cityDescription: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case image = "Image"
        case hasVisited = "Has_Visited"
        case cityDesscription = "Description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        self.hasVisited = try container.decode(Bool.self, forKey: .hasVisited)
        self.cityDescription = try container.decode(String.self, forKey: .cityDesscription)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.hasVisited, forKey: .hasVisited)
        try container.encode(self.cityDescription, forKey: .cityDesscription)
    }
    
}

struct CitiesStruct: Codable {
    let cities: [CityStruct]
    
    enum CodingKeys: String, CodingKey {
        case cities = "Cities"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cities = try container.decode([CityStruct].self, forKey: .cities)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.cities, forKey: .cities)
    }
    
}


