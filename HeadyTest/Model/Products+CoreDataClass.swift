//
//  Products+CoreDataClass.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//
//

import Foundation
import CoreData

public class Products: NSManagedObject {

    convenience init(id2: Int, name: String, dateAdded: String, taxName: String, taxValue: String, viewCount: Int, orderCount: Int, shares: Int, context: NSManagedObjectContext) {
        
        if let ent = NSEntityDescription.entity(forEntityName: "Products", in: context) {
            self.init(entity: ent, insertInto: context)
            self.id2 = Int16(id2)
            self.name = name
            self.dateAdded = dateAdded
            self.taxName = taxName
            self.taxValue = taxValue
            self.viewCount = Int64(viewCount)
            self.orderCount = Int64(orderCount)
            self.shares = Int64(shares)
        } else {
            fatalError("Can't find Entity")
        }
    }
    
}
