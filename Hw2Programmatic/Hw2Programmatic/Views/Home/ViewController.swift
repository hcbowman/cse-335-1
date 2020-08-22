//
//  ViewController.swift
//  Hw2Programmatic
//
//  Created by Hunter Bowman on 8/10/20.
//

import UIKit

// MARK: - Root ViewController
class ViewController: UIViewController {
    
    let cityViewModel: CityViewModel
    let cityTableView: UITableView
    let cityCellID = "cityCell"
    
    init(coreDataPersistenceManager persistenceManager: PersistenceManager) {
        self.cityViewModel = CityViewModel(coreDataPersistenceManager: persistenceManager)
        self.cityTableView = UITableView()
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.dataSource = self
        
        setupTableView()
        
        cityTableView.refreshControl = UIRefreshControl()

    }


}

// MARK: - ViewModel
class CityViewModel {
    
    private let persistenceManager: PersistenceManager
    
    init(coreDataPersistenceManager persistenceManager: PersistenceManager) {
        self.persistenceManager = persistenceManager
    }
    
    func rows() -> Int {
        return persistenceManager.total(City.self)
    }
    
}



// MARK: - UITableView
extension ViewController {
    
    func setupTableView() {
        self.view.addSubview(cityTableView)
        
        cityTableView.translatesAutoresizingMaskIntoConstraints = false
        cityTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        cityTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cityTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cityTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        //let dropObject = UITableViewDropPlaceholder(insertionIndexPath: .init(), reuseIdentifier: "cityCell", rowHeight: .pi)
        //let dropCoordinator = UITableViewDropCoordinator.dr
        
        cityTableView.register(UITableViewCell.self, forCellReuseIdentifier: cityCellID)
        
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        
    }
    
    @objc func handleRefreshControl() {
        // Update your content…
        self.cityTableView.reloadData()
        
        // Dismiss the refresh control.
        DispatchQueue.main.async {
            self.cityTableView.refreshControl?.endRefreshing()
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return cityViewModel.rows()
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cityCellID, for: indexPath)
        
        var contentList = cell.defaultContentConfiguration()
        contentList.text = "City Name"
        contentList.secondaryText = "City Desciption"
        contentList.image = UIImage(named: "Phoenix")
        cell.contentConfiguration = contentList
        
        return cell
    }
    
    
}
