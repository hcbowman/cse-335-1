//
//  JupiterViewController.swift
//  lab2
//
//  Created by hcbowman on 2/5/20.
//  Copyright © 2020 hcbowman. All rights reserved.
//

import UIKit

class JupiterViewController: UIViewController {
    
    var data_from_moon:Float?
    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var earthWeight: UILabel!
    @IBOutlet weak var moonWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        message.text = "Coming from the Moon. On Jupiter Now. I feel much much heavier!"
        earthWeight.text = "Earth Weight = \(data_from_moon ?? 0)"
        moonWeight.text = "Jupiter Weight = \( (data_from_moon! * (2.6)) )"
        
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
