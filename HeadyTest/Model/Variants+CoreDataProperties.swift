//
//  Variants+CoreDataProperties.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//
//

import Foundation
import CoreData


extension Variants {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variants> {
        return NSFetchRequest<Variants>(entityName: "Variants")
    }

    @NSManaged public var color: String?
    @NSManaged public var id3: Int16
    @NSManaged public var price: String?
    @NSManaged public var size: String?
    @NSManaged public var product: Products?

}
