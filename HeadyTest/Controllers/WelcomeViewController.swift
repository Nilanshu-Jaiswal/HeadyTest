//
//  ViewController.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData

class WelcomeViewController: UIViewController {

    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !checkReachability() {
            self.createAlert(title: "Please connect to internet", message: "Showing already saved data")
        }
        else {
            deleteAllData(entity: "Categories")
            getData()
        }
    }
    
    func getData() {
        let URL = "https://stark-spire-93433.herokuapp.com/json"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    let jsonCategories = json["categories"]
                    
                    if jsonCategories.count > 0 {
                        
                        for category in 0...(jsonCategories.count - 1) {
                            let cId = jsonCategories[category]["id"].intValue
                            let cName = jsonCategories[category]["name"].stringValue
                            let cProduct = jsonCategories[category]["products"]
                            let cChild = jsonCategories[category]["child_categories"].stringValue
                            
                            let tempCategory = Categories(id1: cId, name: cName, childCategories: cChild, context: self.context!)
                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                            
                            if cProduct.count > 0 {
                                for product in 0...(cProduct.count - 1) {
                                    let pId = cProduct[product]["id"].intValue
                                    let pName = cProduct[product]["name"].stringValue
                                    let pDate = cProduct[product]["date_added"].stringValue
                                    let pTaxName = cProduct[product]["tax"]["name"].stringValue
                                    let pTaxValue = cProduct[product]["tax"]["value"].stringValue
                                    let pVariants = cProduct[product]["variants"]
                                    let pviewCount = 0
                                    let porderCount = 0
                                    let pshares = 0
                                    
                                    let productCD = Products(id2: pId, name: pName, dateAdded: pDate, taxName: pTaxName, taxValue: pTaxValue, viewCount: pviewCount, orderCount: porderCount, shares: pshares, context: self.context!)
                                    productCD.category = tempCategory
                                    (UIApplication.shared.delegate as! AppDelegate).saveContext()
                                    
                                    if pVariants.count > 0 {
                                        for variant in 0...(pVariants.count - 1) {
                                            let vId = pVariants[variant]["id"].intValue
                                            let vColor = pVariants[variant]["color"].stringValue
                                            let vSize = pVariants[variant]["size"].stringValue
                                            let vPrice = pVariants[variant]["price"].stringValue
                                            
                                            let variantCD = Variants(id3: vId, color: vColor, size: vSize, price: vPrice, context: self.context!)
                                            variantCD.product = productCD
                                            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else {
                        print("No Data Present")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }


    @IBAction func startButton(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController: CategoryTableViewController! = mainStoryboard.instantiateViewController(withIdentifier: "CategoryTableViewController") as! CategoryTableViewController
        nextViewController.title = "Categories"
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func deleteAllData(entity: String)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    
    func checkReachability() -> Bool {
        if currentReachabilityStatus == .reachableViaWiFi || currentReachabilityStatus == .reachableViaWWAN {
            return true
        } else {
            return false
        }
    }
    
    func createAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

