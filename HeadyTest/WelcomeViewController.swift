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

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        let URL = "https://stark-spire-93433.herokuapp.com/json"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json)
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
    
}

