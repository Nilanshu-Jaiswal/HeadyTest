//
//  Categories+CoreDataClass.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//
//

import Foundation
import CoreData


public class Categories: NSManagedObject {

    convenience init(id1: Int, name: String, childCategories: String, context: NSManagedObjectContext) {
        
        if let ent = NSEntityDescription.entity(forEntityName: "Categories", in: context) {
            self.init(entity: ent, insertInto: context)
            self.id1 = Int16(id1)
            self.name = name
            self.childCategories = childCategories
        } else {
            fatalError("Can't find Entity")
        }
    }
    
}
