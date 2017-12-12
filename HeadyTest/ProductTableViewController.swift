//
//  ProductTableViewController.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewController: CoreDataTableViewController {

    var category : Categories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        fetchProducts()
    }
    
    func fetchProducts() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
        fr.sortDescriptors = [NSSortDescriptor(key: "id2", ascending: true)]
        let predicate = NSPredicate(format: "category = %@", self.category!)
        fr.predicate = predicate
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        let product = fetchedResultsController!.object(at: indexPath) as! Products
        
        cell.textLabel?.text = product.name
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController: VariantsTableViewController! = mainStoryboard.instantiateViewController(withIdentifier: "VariantsTableViewController") as! VariantsTableViewController
        nextViewController.title = "Variants"
        let product = fetchedResultsController?.object(at: indexPath) as! Products
        
        nextViewController.product = product
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
