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

    var myParentValue = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCategories()
    }
    
    func fetchCategories() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Categories")
        fr.sortDescriptors = [NSSortDescriptor(key: "id1", ascending: true)]
        
        // add a predicate to have myParent = self.myParentValue
        let predicate = NSPredicate(format: "myParent = %@", self.myParentValue)
        fr.predicate = predicate

        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell1")
        
        let category = fetchedResultsController?.object(at: indexPath) as! Categories
        cell.textLabel?.text =  category.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let category = fetchedResultsController?.object(at: indexPath) as! Categories

        if category.hasProduct == true{
            let nextViewController: ProductTableViewController! = mainStoryboard.instantiateViewController(withIdentifier: "ProductTableViewController") as! ProductTableViewController
            nextViewController.title = "Products"
            nextViewController.category = category
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else
        {
            let nextViewController: CategoryTableViewController! = mainStoryboard.instantiateViewController(withIdentifier: "CategoryTableViewController") as! CategoryTableViewController
            nextViewController.title = "Categories"
            nextViewController.myParentValue = String(category.id1)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
