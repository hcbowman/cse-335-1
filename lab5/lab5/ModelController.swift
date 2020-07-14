//
//  ModelController.swift
//  lab5
//
//  Created by Chelsea Plumb on 3/19/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import Foundation
import CoreData

class ModelController {
    
    //this is the array to store City entities from the coredata
    var fetchResults = [City]()
    
    let managedObjectContext:NSManagedObjectContext?
    
    // Getting a handler to the coredata managed object context
    init(context: NSManagedObjectContext) {
        managedObjectContext = context
    }
    
    /*
    func count() -> Int {
        
        // create a fetch request
        let request: NSFetchRequest<City> = City.fetchRequest()
        
        do {
            let count = try managedObjectContext!.count(for: request)
            return count
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            return 0
        }
    }*/
    
    func fetchRecord() -> Int {
        
        var count: Int
        
        // Create a new fetch request using the City
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        // Execute the fetch request, and cast the results to an array of City objects
        fetchResults = ((try? managedObjectContext!.fetch(fetchRequest)) as? [City])!
        
        
        count = fetchResults.count
        
        // return entities count in the coreData
        return count
    }
    
    func findRecord(name: String) ->NSManagedObject? {
        // retrun data
        var match:NSManagedObject?
        // get a handler to the City entity
        let entDescr = NSEntityDescription.entity(forEntityName: "City", in: managedObjectContext!)
        // create a fetch request
        let request: NSFetchRequest<City> = City.fetchRequest()
        
        
        // associate the request with contact handler
        request.entity = entDescr
        
        // build the search request predicate (query)
        let pred = NSPredicate(format: "(name = %@)", name)
        request.predicate = pred
        
        // perform the query and process the query results
        do {
            var results =
                try managedObjectContext!.fetch(request as!
                    NSFetchRequest<NSFetchRequestResult>)
            
            if results.count > 0 {
                 match = results[0] as! NSManagedObject
                 //return match
            } else {
                //return match
            }
            
        } catch let error {
            print(error.localizedDescription )
        }
        
        return match
        
    }
    
    func addRecord(name: String, description: String) {
        
        // create a new entity object
        let entDescr = NSEntityDescription.entity(forEntityName: "City", in: self.managedObjectContext!)
        
        //add to the manege object context
        let newCity = City(entity: entDescr!, insertInto: self.managedObjectContext)
        newCity.name = name
        newCity.cityDescription = description
        newCity.photo = nil

        // save the updated context
        do {
            try self.managedObjectContext!.save()
        } catch _ { }

    }
    
    func deleteRecord(name:String) {
        
        managedObjectContext?.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    }
    
    func clearData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        
        // performs the batch delete for the contact
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedObjectContext!.execute(deleteRequest)
            try managedObjectContext!.save()
            
        }
        catch let _ as NSError {
            // Handle error
        }
        
    }
    
    func SaveContext(name: String, cityDescription: String, photo: String) {
        // get a handler to the Contacts entity through the managed object context
        let ent = NSEntityDescription.entity(forEntityName: "City", in: self.managedObjectContext!)
        
        // create a contact object instance for insert
        let city = City(entity: ent!, insertInto: managedObjectContext)
        
        // add data to each field in the entity
        city.name = name
        city.cityDescription = cityDescription
        city.photo = photo
        
        // save the new entity
        do {
            try managedObjectContext!.save()
            print("City Saved")
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
