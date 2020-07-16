//
//  DetailViewController.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    var selectedCity:String?
    var coords: CLLocationCoordinate2D?
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mapType: UISegmentedControl!
    
    @IBOutlet weak var lattitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    
    @IBAction func navToLink(_ sender: UIButton) {
        navToLink2()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = selectedCity
        
        getDir()
        
    }
    
    @IBAction func changeMap(_ sender: Any) {
        
        switch(mapType.selectedSegmentIndex)
        {
        case 0:
            map.mapType = MKMapType.standard
        
        case 1:
            map.mapType = MKMapType.satellite
        
        case 2:
            map.mapType = MKMapType.hybrid
            
        default:
            map.mapType = MKMapType.standard
        }
        

    }
    
    @IBAction func searchButton(_ sender: Any) {
        //print("searchButton Pressed")
        search()
    }
    
    func getDir() {
        let geoCoder = CLGeocoder()
        
        
            
        // staring address
        let addressString = selectedCity!
            
        geoCoder.geocodeAddressString(addressString, completionHandler:
            {(placemarks, error) in
                
                if error != nil {
                    print("Geocode failed with error: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    
                    let placemark = placemarks![0]
                    let location = placemark.location
                    self.coords = location!.coordinate
                    
                    //print(self.coords)
                    //print(location)
                    
                    // source is the starting address
                    let source = MKMapItem(placemark: MKPlacemark(coordinate: self.coords!))
                    source.name = "Source"
                    
                    self.lattitudeTextField.text = self.coords!.latitude.description
                    self.longitudeTextField.text = self.coords!.longitude.description
                    
                    self.showMap()
                }
        })
        
        
    }
    
    func showMap() {
        
        
        // another way to create the placemark object
        
        /*   let addressDict =
         [CNPostalAddressStreetKey: address.text!,
         CNPostalAddressCityKey: city.text!,
         CNPostalAddressStateKey: state.text!,
         CNPostalAddressPostalCodeKey: zip.text!]
         
         
         let place = MKPlacemark(coordinate: coords!,
         addressDictionary: addressDict) */
        
        // display the map
        let span: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region: MKCoordinateRegion = MKCoordinateRegion.init(center: coords!, span: span)
        
        self.map.setRegion(region, animated: true)
        
        // add an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coords!
        annotation.title = selectedCity
        //annotation.subtitle = "AZ"
        
        self.map.addAnnotation(annotation)

            
        // source is the starting address
        //let source = MKMapItem(placemark: MKPlacemark(coordinate: coords!))
        //source.name = "Source"
    }
    
    func search() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.searchTextField.text //"pizza"
        request.region = map.region
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            guard let response = response
                else {
                return
            }
            
            //print( response.mapItems )
            var matchingItems:[MKMapItem] = []
            matchingItems = response.mapItems
            
            for i in 1...matchingItems.count - 1 {
                
                let place = matchingItems[i].placemark
                //print(place.location?.coordinate.latitude)
                //print(place.location?.coordinate.longitude)
                //print(place.name)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = place.location!.coordinate
                annotation.title = place.name
                self.map.addAnnotation(annotation)
            }
        }
        
    }

    func navToLink2() {
        
        let scheme = "https"
        let host = "www.google.com"
        let path = "/search"
        let queryItem = URLQueryItem(name: "q", value: selectedCity)
         
         
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = [queryItem]
         
        // let url = NSURL(string: urlComponents.url )!
        UIApplication.shared.open(urlComponents.url!, options: [:], completionHandler: nil)
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
    
    
    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
