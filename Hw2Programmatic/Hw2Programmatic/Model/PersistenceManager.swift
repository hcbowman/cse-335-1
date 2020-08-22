//
//  ModelController.swift
//  hw2
//
//  Created by Hunter Bowman on 8/10/20.
//

import CoreData

public class PersistenceManager {
    
    public typealias VoidCompletion = () -> ()
    
    // MARK: - Properties
    
    private var modelName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    lazy var backgroundContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    // MARK: - Convenience Init
    
    public convenience init(modelName model: String) {
        self.init()
        modelName = model
    }
}

// MARK: - Add
extension PersistenceManager {
    
    public func add<M: NSManagedObject>(_ type: M.Type) -> M? {
        
        var modelObject: M?
        
        if let entity = NSEntityDescription.entity(forEntityName: M.description(), in: context) {
            modelObject = M(entity: entity, insertInto: context)
        }
        return modelObject
    }
}


// MARK: - Fetch
extension PersistenceManager {
    
    public typealias TotalCompletion = ((_ count: Int) -> ())
    public typealias FetchCompletion<M> = ((_ fetched: [M]) -> ())
    
    public func total<M: NSManagedObject>(_ type: M.Type, _ completion: TotalCompletion?=nil) -> Int {
        
        var count = 0
        let entityName = String(describing: type)
        let request = NSFetchRequest<M>(entityName: entityName)
        
        if let completion = completion {
            self.context.perform {
                let _ = self.fetchTotal(request, completion)
            }
        }
        else {
            count = fetchTotal(request)
        }
        return count
    }
    
    private func fetchTotal<M: NSManagedObject>(_ request: NSFetchRequest<M>,
                                                _ completion: TotalCompletion?=nil) -> Int {
        var count = 0
        do {
            count = try context.count(for: request)
            completion?(count)
        }
        catch {
            print("Error executing total: \(error)")
            completion?(0)
        }
        return count
    }
    
    public func fetch<M: NSManagedObject>(_ type: M.Type,
                                          predicate: NSPredicate?=nil,
                                          sort: NSSortDescriptor?=nil,
                                          _ completion: FetchCompletion<M>?=nil) -> [M]? {
        var fetched: [M]?
        let entityName = String(describing: type)
        let request = NSFetchRequest<M>(entityName: entityName)
        
        request.predicate = predicate
        request.sortDescriptors = [sort] as? [NSSortDescriptor]
        
        if let completion = completion {
            self.context.perform {
                let _ = self.fetchObjects(request, completion)
            }
        }
        else {
            fetched = fetchObjects(request)
        }
        return fetched
    }
    
    private func fetchObjects<M: NSManagedObject>(_ request: NSFetchRequest<M>,
                                                  _ completion: FetchCompletion<M>?=nil) -> [M] {
        var fetched: [M] = [M]()
        
        do {
            fetched = try context.fetch(request)
            completion?(fetched)
        }
        catch {
            print("Error executing fetch: \(error)")
            completion?(fetched)
        }
        return fetched
    }
}

// MARK: - Save
extension PersistenceManager {
    
    public func save(_ completion: VoidCompletion?=nil) {
        
        context.perform {
            if self.context.hasChanges {
                do {
                    try self.context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
            completion?()
        }
    }
}

// MARK: - Delete
extension PersistenceManager {
    
    public func delete(by objectID: NSManagedObjectID, _ completion: VoidCompletion?=nil) {
        
        let managedObject = context.object(with: objectID)
        
        context.perform {
            self.context.delete(managedObject)
            completion?()
        }
    }
    
    public func delete<M: NSManagedObject>(_ type: M.Type, predicate: NSPredicate?=nil, _ completion: VoidCompletion?=nil) {
        
        if let objects = fetch(type, predicate: predicate) {
            for modelObject in objects {
                delete(by: modelObject.objectID, completion)
            }
        }
        
        if context.deletedObjects.count > 0 {
            save()
        }
    }
}