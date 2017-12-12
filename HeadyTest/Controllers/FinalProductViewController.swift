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
    
    @IBAction func purchaseButton(_ sender: UIButton) {
        self.createAlert(title: "Purchase Successful", message: "Congratulations! you have purchased this product")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadValues()
    }
    
    func loadValues() {
        category.text = "Category is: " + (variant?.product?.category?.name)!
        product.text = "Product is: " + (variant?.product?.name)!
        dateAdded.text = "Date Added is: " + (variant?.product?.dateAdded)!
        orderCount.text = "Order Count is: " + String((variant?.product?.orderCount)!)
        viewCount.text = "View Count is: " + String((variant?.product?.viewCount)!)
        shares.text = "Total Shares is: " + String((variant?.product?.shares)!)
        taxName.text = "Tax applicable is: " + (variant?.product?.taxName)!
        taxValue.text = "Tax value is: " + (variant?.product?.taxValue)!
        color.text = "Color is: " + (variant?.color)!
        size.text = "Size is: " + (variant?.size)!
        price.text = "Price is: " + (variant?.price)!
    }
    
    func createAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
