//
//  TableViewController.swift
//  lab5
//
//  Created by Chelsea Plumb on 3/19/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    
    // Getting a handler to the coredata managed object context
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var m: ModelController?

    override func viewDidLoad() {
        super.viewDidLoad()
        m = ModelController(context: managedObjectContext)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return (m?.fetchRecord())!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        
        cell.layer.borderWidth = 1.0
        cell.cityTitle?.text = m!.fetchResults[indexPath.row].name
        cell.cityDescription?.text = m!.fetchResults[indexPath.row].cityDescription
        
        if let picture = m!.fetchResults[indexPath.row].photo {
            cell.cityImage?.image =  UIImage(data: picture  as Data)
        } else {
            cell.cityImage?.image = nil
        }

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
            
            // delete the selected object from the managed
            // object context
            managedObjectContext.delete(m!.fetchResults[indexPath.row])
            // remove it from the fetch results array
            m!.fetchResults.remove(at:indexPath.row)
                       
            do {
                // save the updated managed object context
                try managedObjectContext.save()
            } catch {
                           
            }
            
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
        
        // show the alert controller to select an image for the row
        let alert = UIAlertController(title: "Add City", message: "hey?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Name of the City Here"})
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // Do this first, then use method 1 or method 2
            if let name = alert.textFields?.first?.text {
                print("city name: \(name)")
                
                
                //self.citiesList.addCity(nme: name, imgNme: "city.jpg", desc: "It's fun")
                
                
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
        
        
        // reload the table with added row
        // this happens before getting the image, so first we add the row
        // without the image and then add the image
        self.tableView.reloadData()
        
    }
    
    func updateLastRow() {
        let indexPath = IndexPath(row: fetchResults.count - 1, section: 0)
        fruitTable.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    func initCounter() {
        counter = UserDefaults.init().integer(forKey: "counter")
    }
    
    func updateCounter() {
        counter += 1
        UserDefaults.init().set(counter, forKey: "counter")
        UserDefaults.init().synchronize()
    }
    
    @IBAction func deleteAll(_ sender: UIBarButtonItem) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FruitEntity")
        
        // whole fetchRequest object is removed from the managed object context
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedObjectContext.execute(deleteRequest)
            try managedObjectContext.save()
            
            
        }
        catch let _ as NSError {
            // Handle error
        }
        
        fruitTable.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedIndex: IndexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        
        //let city = citiesList.getCity(i: selectedIndex.row)
        let city = m?.findRecord(name: selectedIndex.)
        
        // Get the new view controller using segue.destination.
        if (segue.identifier == "detailView") {
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedCity = city.getName()
            }
            
        }
        
        // Pass the selected object to the new view controller.
    }

}
