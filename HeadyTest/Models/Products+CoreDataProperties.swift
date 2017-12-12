//
//  Products+CoreDataProperties.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var dateAdded: String?
    @NSManaged public var id2: Int16
    @NSManaged public var name: String?
    @NSManaged public var orderCount: Int64
    @NSManaged public var shares: Int64
    @NSManaged public var taxName: String?
    @NSManaged public var taxValue: String?
    @NSManaged public var viewCount: Int64
    @NSManaged public var category: Categories?
    @NSManaged public var myVariants: NSSet?

}

// MARK: Generated accessors for myVariants
extension Products {

    @objc(addMyVariantsObject:)
    @NSManaged public func addToMyVariants(_ value: Variants)

    @objc(removeMyVariantsObject:)
    @NSManaged public func removeFromMyVariants(_ value: Variants)

    @objc(addMyVariants:)
    @NSManaged public func addToMyVariants(_ values: NSSet)

    @objc(removeMyVariants:)
    @NSManaged public func removeFromMyVariants(_ values: NSSet)

}
