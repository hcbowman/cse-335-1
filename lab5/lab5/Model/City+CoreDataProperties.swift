//
//  City+CoreDataProperties.swift
//  lab5
//
//  Created by Chelsea Plumb on 3/19/20.
//  Copyright © 2020 ASU. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var cityDescription: String?
    @NSManaged public var name: String?
    @NSManaged public var photo: Data?

}
