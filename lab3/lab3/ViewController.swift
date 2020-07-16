//
//  ViewController.swift
//  lab3
//
//  Created by Hunter Bowman on 2/13/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fDictionary:FoodDictionary = FoodDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var foodNameIn: UITextField!
    @IBOutlet weak var restaurantNameIn: UITextField!
    @IBOutlet weak var priceIn: UITextField!
    
    @IBOutlet weak var foodNameSearchIn: UITextField!
    @IBOutlet weak var results: UITextView!
    
    @IBAction func addEntry(_ sender: Any) {
        
        
        
        // check if input fields are empty
        if let name = foodNameIn.text!,
            let location = restaurantNameIn.text,
            let price = UInt8(priceIn.text!) {
            
            
            
            // create a person record
            //let foodRecord =  Food(n: name, l:location, p:price)
                
            fDictionary.add(name, location, price)
                
            // remove data from the text fields
            self.foodNameIn.text = ""
            self.restaurantNameIn.text = ""
            self.priceIn.text = ""
            
        } else {
            
            // Alert message will be displayed to th user if there is no input
            let alert = UIAlertController(title: "Data Input Error", message: "Data Inputs are either empty or incorrect types", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        
    }
    
    @IBAction func deleteEntry(_ sender: Any) {
        
        // check if input fields are empty
        if let name = foodNameIn.text!,
            let location = restaurantNameIn.text,
            let price = UInt8(priceIn.text!) {
            
            
            
            //let foodRecord =  Food(n: name, l:location, p:price)
                
            fDictionary.deleteRec(n: name)
                
            // remove data from the text fields
            self.foodNameIn.text = ""
            self.restaurantNameIn.text = ""
            self.priceIn.text = ""
            
        } else {
            
            // Alert message will be displayed to th user if there is no input
            let alert = UIAlertController(title: "Data Input Error", message: "Data Inputs are either empty or incorrect types", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    @IBAction func searchEntry(_ sender: Any) {
        
        
        // show the alert controller with data input text field
        let alertController = UIAlertController(title: "Search Record", message: "", preferredStyle: .alert)
        
        let serachAction = UIAlertAction(title: "Search", style: .default) { (aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            if !text.isEmpty {
                let name = text
                let d =  self.fDictionary.search(n: name)
                if let x = d {
                    self.results.text = x.getLocation()
                    self.results.text = x.getPrice()
                }
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter ssn here"
            textField.keyboardType = .decimalPad
        }
        
        alertController.addAction(serachAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func editEntry(_ sender: Any) {
    }
    
}

