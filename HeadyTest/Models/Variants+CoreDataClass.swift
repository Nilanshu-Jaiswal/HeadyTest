//
//  Variants+CoreDataClass.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//
//

import Foundation
import CoreData


public class Variants: NSManagedObject {

    convenience init(id3: Int, color: String, size: String, price: String, context: NSManagedObjectContext) {
        
        if let ent = NSEntityDescription.entity(forEntityName: "Variants", in: context) {
            self.init(entity: ent, insertInto: context)
            self.id3 = Int16(id3)
            self.color = color
            self.size = size
            self.price = price
        } else {
            fatalError("Can't find Entity")
        }
    }
    
}
