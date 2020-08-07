//
//  CityTableViewCell.swift
//  lab4
//
//  Created by Hunter Bowman on 2/27/20.
//  Copyright © 2020 Hunter Bowman. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var cityDescription: UILabel!
    @IBOutlet weak var cityImage: UIImageView! {
        didSet {
            cityImage.layer.cornerRadius = cityImage.bounds.width/2
            cityImage.clipsToBounds = true
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
