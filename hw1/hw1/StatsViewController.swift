//
//  StatsViewController.swift
//  hw1
//
//  Created by Hunter Bowman on 3/7/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    private var GameDTB: Games?
    
    @IBOutlet weak var game1TextView: UITextView!
    @IBOutlet weak var game2TextView: UITextView!
    @IBOutlet weak var game3TextView: UITextView!
    @IBOutlet weak var game4TextView: UITextView!
    @IBOutlet weak var game5TextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Game Stats"
        
        printStat()
    }
    
    func setGameRef(gDTB: Games) {
        self.GameDTB = gDTB
    }
    
    func printStat() {
        
        switch GameDTB?.gameNumber() {
        case 0:
            break
        case 1:
            game1TextView.text = GameDTB?.printTableByIndex(index: 1)
        case 2:
            game2TextView.text = GameDTB?.printTableByIndex(index: 2)
        case 3:
            game3TextView.text = GameDTB?.printTableByIndex(index: 3)
        case 4:
            game4TextView.text = GameDTB?.printTableByIndex(index: 4)
        case 5:
            game5TextView.text = GameDTB?.printTableByIndex(index: 5)
        default:
            break

        }
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination
        
        
        // Pass the selected object to the new view controller.
    //}
    

}
