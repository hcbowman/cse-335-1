//
//  ViewController.swift
//  hw1
//
//  Created by Hunter Bowman on 3/7/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // The Game Database
    var GameDTB: Games = Games()
    
    // MARK: - IB Variables and Objects
    @IBOutlet weak var headacheSegmentedControl: UISegmentedControl!
    @IBOutlet weak var pressureHeadSegmentedControl: UISegmentedControl!
    @IBOutlet weak var neckPainSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nauseaSegmentedControl: UISegmentedControl!
    @IBOutlet weak var dizzinesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var blurryVisionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var balanceProbSegmentedControl: UISegmentedControl!
    @IBOutlet weak var lightSensSegmentedControl: UISegmentedControl!
    @IBOutlet weak var soundSensSegmentedControl: UISegmentedControl!
    @IBOutlet weak var feelingSlowSegmentedControl: UISegmentedControl!
    
    @IBAction func addData(_ sender: UIButton) {
        
        
        
        GameDTB.updatePainSym(symptom: "Headache", pain: headacheSegmentedControl!.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Pressure Head", pain: pressureHeadSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Neck Pain", pain: neckPainSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Nausea", pain: nauseaSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Dizzines", pain: dizzinesSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Blurry Vision", pain: blurryVisionSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Balance Prob", pain: balanceProbSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Light Sensitive", pain: lightSensSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Sound Sensitive", pain: soundSensSegmentedControl.selectedSegmentIndex)
        GameDTB.updatePainSym(symptom: "Feeling Slow", pain: feelingSlowSegmentedControl.selectedSegmentIndex)
        
        GameDTB.addGame()
        
        print("data added")
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Rate How You Feel"
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination
        if (segue.identifier == "toStatView") {
            if let vController: StatsViewController = segue.destination as? StatsViewController {
                
                vController.setGameRef(gDTB: GameDTB)
                
            }
        }
        
        
    }


}

