//
//  ViewController.swift
//  Hw2Programmatic
//
//  Created by Hunter Bowman on 8/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    let tableViewOther = UITableView()
    
    private let modelController: ModelController
    
    init(modelController: ModelController) {
        self.modelController = modelController
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        

    }


}

class myTableView: UITableView {
    init() {
        super.init(frame: )
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableView
extension ViewController {
    
    func setupTableView() {
        self.view.addSubview(tableViewOther)
        
        tableViewOther.translatesAutoresizingMaskIntoConstraints = false
        tableViewOther.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableViewOther.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableViewOther.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableViewOther.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }

}

