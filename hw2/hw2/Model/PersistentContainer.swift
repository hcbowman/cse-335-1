//
//  PersistentContainer.swift
//  hw2
//
//  Created by Hunter Bowman on 7/28/20.
//

import CoreData

class PersistentContainer: NSPersistentContainer {
    
    // MARK: - Core Data Saving support
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }

}
