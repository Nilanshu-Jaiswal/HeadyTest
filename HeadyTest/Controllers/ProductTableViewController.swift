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
        
        print(category?.childCategories)
        
        let homeButton   = UIBarButtonItem(title: "HOME", style: .plain, target: self, action: #selector(home))
        let sortButton = UIBarButtonItem(title: "SORT", style: .plain, target: self, action: #selector(sortOptions))
        navigationItem.rightBarButtonItems = [homeButton, sortButton]
        
        fetchProducts(x: NSSortDescriptor(key: "id2", ascending: true))
    }
    
    func fetchProducts(x: NSSortDescriptor) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
        fr.sortDescriptors = [x]
        let predicate = NSPredicate(format: "category = %@", self.category!)
        fr.predicate = predicate
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    @objc func sortOptions() {
        let actionSheetController = UIAlertController(title: "SORT", message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelActionButton)
        
        let viewCountActionButton = UIAlertAction(title: "Most Views", style: .default) { action -> Void in
            self.fetchProducts(x: NSSortDescriptor(key: "viewCount", ascending: false))
        }
        actionSheetController.addAction(viewCountActionButton)
        
        let orderCountActionButton = UIAlertAction(title: "Most Orders", style: .default) { action -> Void in
            self.fetchProducts(x: NSSortDescriptor(key: "orderCount", ascending: false))
        }
        actionSheetController.addAction(orderCountActionButton)
        
        let sharesActionButton = UIAlertAction(title: "Most Shares", style: .default) { action -> Void in
            self.fetchProducts(x: NSSortDescriptor(key: "shares", ascending: false))
        }
        actionSheetController.addAction(sharesActionButton)
        
        self.present(actionSheetController, animated: true, completion: nil)
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
