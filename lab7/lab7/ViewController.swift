//
//  ViewController.swift
//  lab7
//
//  Created by Hunter Bowman on 4/18/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate {
    
    var selectedCity:String?
    var coords: CLLocationCoordinate2D?

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultsTextView: UITextView!
    
    struct quakeResults: Decodable {
        
       let date: String
       let time: String
       let magnitude: String
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchButton(_ sender: Any) {
        
        let geoCoder = CLGeocoder()

        
        // staring address
        let addressString = searchTextField.text!
            
        geoCoder.geocodeAddressString(addressString) {(placemarks, error) in
            
                if error != nil {
                    print("Geocode failed with error: \(error!.localizedDescription)")
                } else {
                    
                    let placemark = placemarks![0]
                    let location = placemark.location
                    self.coords = location!.coordinate

                }
                
        }
        

    }
    
    @IBAction func getResultsButton(_ sender: Any) {
        getDir()
    }
    
    func getDir() {
        //let username = "hcbowman"
        
        //let east = self.coords!.longitude.advanced(by: 10.00)
        //let west = self.coords!.longitude.advanced(by: -10.00)
        //let south = self.coords!.latitude.advanced(by: -10.00)
        //let north = self.coords!.latitude.advanced(by: 10.00)
        
            
        //let urlAsString = "http://api.geonames.org/earthquakesJSON?north=\(north)&south=\(south)&east=\(east)&west=\(west)&username=\(username)"
        let urlAsString = "http://api.geonames.org/earthquakesJSON?north=43.45&south=23.45&east=102.06&west=122.06&username=hcbowman"
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
            
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            
            //quakeResults.init(date: "1/01/2020", time: "10:15", magnitude: "9")
            
            //let jsonData = data.data(encoding: .utf8)!
            let decoder = JSONDecoder()
            let jsonResult = try! decoder.decode(quakeResults.self, from: data!)
            
            
            // let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                
            print(jsonResult)
            
            let date = jsonResult.date
            let time = jsonResult.time
            let magnitude = jsonResult.magnitude
                
            let res = "Results : \(date) \(time) \(magnitude)"
            print(res)
             
            DispatchQueue.main.async {
                self.resultsTextView.text = res
            }
        
        })
            
        jsonQuery.resume()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //let textField = UITextField(frame: CGRect(x: 20.0, y:90.0, width: 280.0, height: 44.0))
        
        searchTextField.delegate = self
        searchTextField.returnKeyType = .done
        //searchTextField.backgroundColor = UIColor.white
    }
    
    func textFieldShouldReturn(_ searchTextField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}

