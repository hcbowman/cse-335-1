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
    
    func rows() -> Int {
        return persistenceManager.total(City.self)
    }
    
    // MARK: - JSON
    func parseCityJSON() {
        
        let dataJSON = readLocalFile(forName: "City")
        
        do {
            let decodedData = try JSONDecoder().decode(CityStruct.self,
                                                       from: dataJSON)
            
            print("Name: ", decodedData.name)
            print("Description: ", decodedData.description)
            print("===================================")
        } catch {
            print("decode error")
        }
        
        
    }
    
    private func readLocalFile(forName name: String) -> Data {
        
        // FIX: This whole mess needs a new approach
        do {
            
            let bundlePath = Bundle.main.path(forResource: name, ofType: "json")!
            let jsonData = (try String(contentsOfFile: bundlePath).data(using: .utf8))!
            
            return jsonData
        } catch {
            print(error)
        }

        
    }
    
}

struct CityStruct: Codable {
    var name: String
    var image: String
    var visited: Bool
    var description: String
    
}
