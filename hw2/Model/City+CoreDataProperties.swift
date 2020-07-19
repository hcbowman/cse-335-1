//
//  City+CoreDataProperties.swift
//  hw2
//
//  Created by Hunter Bowman on 7/18/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var image: String?
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var visited: Bool

}
