//
//  ViewController.swift
//  lab2
//
//  Created by hcbowman on 2/5/20.
//  Copyright © 2020 hcbowman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data_from_moon:Float?
    var data_from_jupiter:Float?
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var message: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        message.text = "On Earth Now"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MoonViewController
        if(segue.identifier == "toMoonView") {
            destination.data_from_earth = Float(weightInput.text!)
        }
        
    }
    
    @IBAction func fromMoon(segue: UIStoryboardSegue)
    {
        
        message.text = "Returned From Moon. On Earth now. I feel heavy"
        
        if let sourceView = segue.source as? MoonViewController {
            let data_from_moon = sourceView.data_from_earth
            weightInput.text = "\(data_from_moon)"
        }
        
    }
    
    @IBAction func fromJupiterToEarth(segue: UIStoryboardSegue)
    {
        
        message.text = "Returned From Jupiter. On Earth now. I feel much lighter!"
        
        if let sourceView = segue.source as? JupiterViewController {
            let data_from_jupiter = sourceView.data_from_moon
            weightInput.text = "\(data_from_jupiter)"
            
        }
        
    }


}

