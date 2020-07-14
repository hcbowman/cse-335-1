//
//  DetailViewController.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCity:String?
    
    @IBAction func navToLink(_ sender: UIButton) {
        navToLink2()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
