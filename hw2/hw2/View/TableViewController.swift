//
//  TableViewController.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//
//
//cities.append(City(name: "Phoenix, AZ", imageName: "Phoenix.jpg", description: "Hot"))
//cities.append(City(name: "New York", imageName: "NewYork.jpg", description: "Too many people"))
//cities.append(City(name: "San Francisco", imageName: "SanFrancisco.jpg", description: "Silicon Valley"))
//cities.append(City(name: "Portland", imageName: "Portland.jpeg", description: "Weird"))
//cities.append(City(name: "Anchorage", imageName: "Anchorage.jpg", description: "Cold"))

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    
    var container: PersistentContainer!
    var context: NSManagedObjectContext!
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //Model
    //var citiesList: Cities = Cities()
    var cities:[City]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard container != nil else {
            fatalError("This view needs a persistent container.")
        }
        
        context = container.viewContext
        
        preFillTable()
        fetchItems()
        
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
    
    func preFillTable() {
        
        let city = City(context: self.context)
        
        city.name = "Phoenix, AZ"
        city.image = "Phoenix.jpg"
        city.info = "It's hot."
        city.visited = true
        
        // Save the data
        do {
            try self.context.save()
        } catch {
            
        }
        
    }
    
    func fetchItems() {
        
        do {
            
            let request = City.fetchRequest() as NSFetchRequest<City>
            
            // Set the filtering and sorting on the request
            let predicate = NSPredicate(format: "name CONTAINS[c] 'P'")
            request.predicate = predicate
            
            // Fetches all data from Core Data
            cities.self = try context.fetch(City.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        //return citiesList.getNumOfSections()
        
        // TODO: Return the number of sections of cities, grouped by first letter of name
        //return cities?.count ?? 0
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // TODO: The number of cities that would fall in a particular section
        //return citiesList.getNumOfRowsInSection(section: section)
        return cities?.count ?? 0
    }
    
    /*
    // TODO: Get the title for the particular section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = citiesList.getKey(section: section)
        label.backgroundColor = UIColor.systemIndigo
        return label
        
    }
     */

    
    
    /// cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityTableViewCell ?? CityTableViewCell(style: .default, reuseIdentifier: "cityCell")
        
        cell.layer.borderWidth = 1.0
        
        // TODO: Add functionality for the tableView sections
        // Gets the information needed to find the section of the city, in the model
        //let sectionLetter = citiesList.getKeys()[indexPath.section]
        
        // Gets the section, in the model, that the city was placed in
        //let citValues = citiesList.getCities(section: sectionLetter)
        
        // Gets the city object from the model so its' data can be parsed for the new cell
        //let cityItem = citValues[indexPath.row]
        
        
        /// Get city object from model
        // FIXME: Get rid of the force unwrap
        let city = cities![indexPath.row]
        //guard let cityItem = cities[indexPath.row] else { return }
        
        
        /// Pass data variables of the city item to the cell
        cell.cityTitle.text = city.name
        cell.cityDescription.text = city.info
        // FIXME: Fix the shoddy coalescing
        cell.cityImage.image = UIImage(named: city.image ?? "Anchorage")

        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return citiesList.getKeys()
    }
     */

    
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
            
            //citiesList.deleteCity(i: indexPath.row)
            //cities?.remove(at: indexPath.row)
            
            // From the 'cities' array, the City to be romved is at the same index as the selected row
            let cityToRemove = self.cities![indexPath.row]
            
            // Remove the city
            self.context.delete(cityToRemove)
            
            // Save the data
            
            /*
            do {
                try self.context.save()
            }
            catch {
                
            }
             */
            
            // This regenerates the 'cities' array, from Core Data, that had a City removed()
            self.fetchItems()
            
            // Delete the row from the data source
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        } else if editingStyle == .insert {
            // TODO: Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }    
    }
    
    // Add a City
    @IBAction func addCity(_ sender: Any) {
        
        /// Create alert
        let alert = UIAlertController(title: "Add City", message: "What is the city name?", preferredStyle: .alert)
        
        // Cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //alert.addTextField(configurationHandler: { textField in textField.placeholder = "Enter Name of the City Here"})
        
        // Create + configure button handler
        let submitButton = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { (action) in
                
                // Do this first, then use method 1 or method 2
                if let name = alert.textFields?.first?.text {
                    
                    print("city name: \(name)")
                    // let f4 = fruit(fn: name, fd: "Healthy", fin: "banana.jpg")
                    let city = City(context: self.context)
                    city.name = name
                    
                    // TODO: Add functionality for adding a photo
                    city.image = "city.jpg"
                    
                    // TODO: Add functionality for the discription
                    city.info = "It's fun"
                    
                    // TODO: Add functionality so the user can set if they vistited or not
                    city.visited = false
                    
                    // Save the data
                    do {
                        try self.context.save()
                    } catch {
                        
                    }
                    
                    // Re-fetch the data
                    self.fetchItems()
                    
                }
                
            })
        
        // Add button
        alert.addAction(submitButton)
        
        // Show alert
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
        
        
        // FIXME: Change the force unwrap
        //let city = citiesList.getCity(i: selectedIndex.row)
        let city = cities![selectedIndex.row]
        
        // Get the new view controller using segue.destination.
        if (segue.identifier == "detailView") {
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedCity = city.name
            }
            
        }
        
        // Pass the selected object to the new view controller.
    }
    
    

}
