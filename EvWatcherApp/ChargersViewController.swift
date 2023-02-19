//
//  ChargersViewController.swift
//  EvWatcherApp
//
//  Created by 한준혁 on 2023/02/04.
//

import UIKit

class ChargersViewController: UITableViewController {
    var chargersDataSource = ChargerDataSource.shared
}

// MARK: - UITableViewDataSource
extension ChargersViewController {
    override func viewDidLoad() {
        self.navigationItem.title = "근대역사박물관(군산시 장미동 1-67) - kp002562"
        self.chargersDataSource.tableView = self.tableView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chargersDataSource.numberOfChargers()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChargerCell.identifier) as! ChargerCell
        cell.charger = chargersDataSource.charger(at: indexPath)
        return cell
    }
}
