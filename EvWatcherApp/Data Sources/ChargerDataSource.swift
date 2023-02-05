//
//  ChargerDataSource.swift
//  EvWatcherApp
//
//  Created by 한준혁 on 2023/02/04.
//

import UIKit

class ChargerDataSource {
    var chargers: [Charger]
    
    static func loadChargersData() -> [Charger] {
//        var d : Duration = Duration.hours(1) + Duration.minutes(24)
        return [
      
            Charger(chargerId: "01", address: "전라북도 군산시 장미동 1-67" , status: "충전중" , current_image: "charger4" , duration : Duration.seconds(3850) ),
//            Charger(name: "충전기1", address: "군산시 가나로 48 상세주소 상세주소" , status: "충전중" , current_image: "charger2"),
//            Charger(name: "충전기1", address: "군산시 가나로 48 상세주소 상세주소" , status: "충전중",  current_image: "charger3"),
        ]
    }
    
    init() {
        chargers = ChargerDataSource.loadChargersData()
    }
    
    func numberOfChargers() -> Int {
        chargers.count
    }
    
    func append(charger:Charger, to tableView: UITableView) {
        chargers.append(charger)
        tableView.insertRows(at: [IndexPath(row: chargers.count-1, section:0)], with: .automatic)
    }
    
    func charger(at indexPath: IndexPath) -> Charger {
        chargers[indexPath.row]
    }
}
