//
//  Categories+CoreDataProperties.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 13/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var id1: Int16
    @NSManaged public var name: String?
    @NSManaged public var hasProduct: Bool
    @NSManaged public var myParent: String?
    @NSManaged public var myProducts: NSSet?

}

// MARK: Generated accessors for myProducts
extension Categories {

    @objc(addMyProductsObject:)
    @NSManaged public func addToMyProducts(_ value: Products)

    @objc(removeMyProductsObject:)
    @NSManaged public func removeFromMyProducts(_ value: Products)

    @objc(addMyProducts:)
    @NSManaged public func addToMyProducts(_ values: NSSet)

    @objc(removeMyProducts:)
    @NSManaged public func removeFromMyProducts(_ values: NSSet)

}
