//
//  FoodDictionary.swift
//  lab3
//
//  Created by Hunter Bowman on 2/13/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import Foundation

class FoodDictionary {
    
    
    // dictionary that stores food records
    var foodList:[String:Food] = [String:Food] ()
    
    init() { }
    
    
    //Add : add new food info object to the dictionary. Ask the user to enter the food name, and a restaurant that food can be ordered and the price. Add need to be a navigation bar button item.
    func add(_ name:String, _ location:String, _ price:UInt8) {
        let foodRecord =  Food(n: name, l:location, p:price)
        infoRepository[foodRecord.getName()] = foodRecord
    }
    
    func add(f:Food) {
        print("adding" + f.getName()!)
        foodList[f.getName()!] = f
    }
    
    
    //Delete : delete a food object from the dictionary. Ask the use to enter name of the food item to be deleted. Detele need to be a navigation bar button item.
    func deleteRec(n:String) {
        foodRecord[n] = nil
    }
    
    
    //Search : search a record in the dictionary. Search is based on the name of the food. Therefore, your app should ask the user to enter name of the food to be searched. If found, return the record and display it (name of the food,
    //restaurant that you can order the food) in the view, and the cost. Use the UIAlertController to read the name of the food for the search operation. Search need to be a tool bar button item.
    func search(n:String) -> Food? {
        var found = false
        
        for (name, _) in foodList {
            
            if name == n {
                found = true
                break
            }
        }
        
        if found {
           return foodList[n]
        } else {
            return nil
        }
    }
    
    
    //Edit: Once the search is done, then users can change the restaurant of the food (not the name of the food) and/or the price. Then, when the save button is pressed, update the record in the dictionary. Edit need to be a tool bar button item.
    func edit( _ n:String, _ l:String, _ p:UInt8) {
        
        if l {
            foodList[n]?.setLocation(l: l)
        }
        
        if p {
            foodList[n]?.setPrice(p: p)
        }
    }
    
    
    //Navigate all the records using next and prev buttons: Starting from the first record, next and pre buttons should display one record at a time. If the last record has been fetched and user press the next,
    //display a message saying “No more records”. Similarly, if the pre button is pressed while showing the first record, display the message “Showing the first Record”. Next and Prev need to be a tool bar button items.
    
    
}
