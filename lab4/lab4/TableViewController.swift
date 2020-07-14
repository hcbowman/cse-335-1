//
//  TableViewController.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    
    
    //Model
    var citiesList: Cities = Cities()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return citiesList.getCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        
        cell.layer.borderWidth = 1.0
        
        // Get city items from model
        let cityItem = citiesList.getCity(i:indexPath.row)
        
        // Pass data variables of the city item to the cell
        cell.cityTitle.text = cityItem.getName()
        cell.cityDescription.text = cityItem.getDescription()
        cell.cityImage.image = UIImage(named: cityItem.getImageName())
        

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            citiesList.deleteCity(i: indexPath.row)
            
            // Delete the row from the data source
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        } else if editingStyle == .insert {
            // #TODO:Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Add a City
    @IBAction func addCity(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add City", message: "hey?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Name of the City Here"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // Do this first, then use method 1 or method 2
            if let name = alert.textFields?.first?.text {
                print("city name: \(name)")
                
               // let f4 = fruit(fn: name, fd: "Healthy", fin: "banana.jpg")
                
                self.citiesList.addCity(nme: name, imgNme: "city.jpg", desc: "It's fun")
                
                //Method 1
               
                let indexPath = IndexPath (row: self.citiesList.getCount() - 1, section: 0)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [indexPath], with: .automatic)
                self.tableView.endUpdates()
                
               //Method 2
                //self.fruitTable.reloadData()
            }
        }))
        
        self.present(alert, animated: true)
        
        
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedIndex: IndexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        
        let city = citiesList.getCity(i: selectedIndex.row)
        
        // Get the new view controller using segue.destination.
        if (segue.identifier == "detailView") {
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedCity = city.getName()
            }
            
        }
        
        // Pass the selected object to the new view controller.
    }
    

}
