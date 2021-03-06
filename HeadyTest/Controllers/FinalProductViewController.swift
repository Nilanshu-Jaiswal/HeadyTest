//
//  FinalProductViewController.swift
//  HeadyTest
//
//  Created by Nilanshu Jaiswal on 12/12/17.
//  Copyright © 2017 Nilanshu Jaiswal. All rights reserved.
//

import UIKit

class FinalProductViewController: UIViewController {

    var variant : Variants?
    
    // MARK: - Outlets

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var dateAdded: UILabel!
    @IBOutlet weak var orderCount: UILabel!
    @IBOutlet weak var viewCount: UILabel!
    @IBOutlet weak var shares: UILabel!
    @IBOutlet weak var taxName: UILabel!
    @IBOutlet weak var taxValue: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var price: UILabel!
    
    // MARK: - Methods

    @IBAction func purchaseButton(_ sender: UIButton) {
        
        let adhocAlert = UIAlertController(title: "Purchase", message: "Are you sure you want to purchase this item!", preferredStyle: UIAlertControllerStyle.alert)
        
        adhocAlert.addAction(UIAlertAction(title: "NO", style: .default, handler: { (action: UIAlertAction!) in
        }))
        
        adhocAlert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (action: UIAlertAction!) in
            self.createAlert(title: "Purchase Successful", message: "Congratulations! you have purchased this product")
        }))
        
        self.present(adhocAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "HOME", style: .plain, target: self, action: #selector(home))

        loadValues()
    }
    
    @objc func home() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    func loadValues() {
        category.text = "Category is: " + (variant?.product?.category?.name)!
        product.text = "Product is: " + (variant?.product?.name)!
        dateAdded.numberOfLines = 0
        dateAdded.text = "Date Added: " + "\n" + (variant?.product?.dateAdded)!
        orderCount.text = "Order Count: " + String((variant?.product?.orderCount)!)
        viewCount.text = "View Count: " + String((variant?.product?.viewCount)!)
        shares.text = "Total Shares: " + String((variant?.product?.shares)!)
        taxName.text = "Tax applicable: " + (variant?.product?.taxName)!
        taxValue.text = "Tax value: " + (variant?.product?.taxValue)!
        color.text = "Color: " + (variant?.color)!
        size.text = "Size: " + (variant?.size)!
        price.text = "Price: " + (variant?.price)!
    }
    
    func createAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
