//
//  CategoryTableViewController.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCategories()
    }
    
    func fetchCategories() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Categories")
        fr.sortDescriptors = [NSSortDescriptor(key: "id1", ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell1")
        
        let category = fetchedResultsController?.object(at: indexPath) as! Categories
        cell.textLabel?.text =  category.name
        
        return cell
    }

}
