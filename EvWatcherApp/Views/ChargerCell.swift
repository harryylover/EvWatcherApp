//
//  ChargerCell.swift
//  EvWatcherApp
//
//  Created by 한준혁 on 2023/02/04.
//

import UIKit

class ChargerCell: UITableViewCell {
    static let identifier = "charger_summary_cell"
    
    @IBOutlet weak var currentImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var charger: Charger? {
        didSet {
            guard let charger = charger else { return}
            
            nameLabel.text = charger.chargerId
            statusLabel.text = charger.status! + "(" + charger.duration!.formatted() + ")"
            if (charger.current_image != nil) {
                currentImageView.image = UIImage(named: charger.current_image!)
            }
        }
    }
    
}
