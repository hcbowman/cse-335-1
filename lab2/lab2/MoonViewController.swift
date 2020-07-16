//
//  MoonViewController.swift
//  lab2
//
//  Created by hcbowman on 2/5/20.
//  Copyright © 2020 hcbowman. All rights reserved.
//

import UIKit

class MoonViewController: UIViewController {
    
    var data_from_earth:Float?
    var data_from_jupiter:Float?

    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var earthWeight: UILabel!
    @IBOutlet weak var moonWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        message.text = "Coming from the Earth. On Moon now. I feel much lighter!"
        earthWeight.text = "Earth Weight = \(data_from_earth ?? 0)"
        moonWeight.text = "Moon Weight = \( (data_from_earth! * (1/6)) )"

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! JupiterViewController
        if(segue.identifier == "toJupiterView") {
            destination.data_from_moon = data_from_earth
        }
        
    }
    
    @IBAction func fromJupiter(segue: UIStoryboardSegue)
    {
        
        message.text = "Returned From Jupiter. On Moon now. I feel much lighter!"
        
        if let sourceView = segue.source as? JupiterViewController {
            let data_from_jupiter = sourceView.data_from_moon
            moonWeight.text = "Moon Weight = \(data_from_jupiter!*(1/6))"
            
        }
        
    }

}
