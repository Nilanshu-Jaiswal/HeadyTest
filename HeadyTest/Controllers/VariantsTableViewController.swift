//
//  VariantsTableViewController.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//

import UIKit
import CoreData

class VariantsTableViewController: CoreDataTableViewController {
    
    var product : Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeButton   = UIBarButtonItem(title: "HOME", style: .plain, target: self, action: #selector(home))
        let sortButton = UIBarButtonItem(title: "SORT", style: .plain, target: self, action: #selector(sortOptions))
        navigationItem.rightBarButtonItems = [homeButton, sortButton]

        fetchVariants(x: NSSortDescriptor(key: "id3", ascending: true))
    }
    
    func fetchVariants(x: NSSortDescriptor) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Variants")
        fr.sortDescriptors = [x]
        let predicate = NSPredicate(format: "product = %@", self.product!)
        fr.predicate = predicate
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    @objc func sortOptions() {
        let actionSheetController = UIAlertController(title: "SORT", message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelActionButton)
        
        let colorActionButton = UIAlertAction(title: "Color", style: .default) { action -> Void in
            self.fetchVariants(x: NSSortDescriptor(key: "color", ascending: false))
        }
        actionSheetController.addAction(colorActionButton)
        
        let sizeActionButton = UIAlertAction(title: "Size", style: .default) { action -> Void in
            self.fetchVariants(x: NSSortDescriptor(key: "size", ascending: true))
        }
        actionSheetController.addAction(sizeActionButton)
        
        let priceActionButton = UIAlertAction(title: "Price", style: .default) { action -> Void in
            self.fetchVariants(x: NSSortDescriptor(key: "price", ascending: true))
        }
        actionSheetController.addAction(priceActionButton)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell3")
        
        let variant = fetchedResultsController?.object(at: indexPath) as! Variants
        cell.textLabel?.text = variant.color
        
        let size = variant.size ?? "0"
        let price = variant.price ?? "0"
        
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Size: " + size + "\n" + "Price: " + price
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController: FinalProductViewController! = mainStoryboard.instantiateViewController(withIdentifier: "FinalProductViewController") as! FinalProductViewController
        
        let variant = fetchedResultsController?.object(at: indexPath) as! Variants
        nextViewController.variant = variant
        nextViewController.title = "Purchase"

        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
