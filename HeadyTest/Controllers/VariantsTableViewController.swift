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
        
        fetchVariants()
    }
    
    func fetchVariants() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Variants")
        fr.sortDescriptors = [NSSortDescriptor(key: "id3", ascending: true)]
        let predicate = NSPredicate(format: "product = %@", self.product!)
        fr.predicate = predicate
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
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
