//
//  WeatherInformationCell.swift
//  Weather
//
//  Created by Nischal Hada on 6/19/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var histoyImage: UIImageView!
    var histoyImageClicked: (()->())?
    
    var WeatherModel: City? {
        didSet {
            guard let data = WeatherModel else {
                return
            }
            labelCityName.set(data.name)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.histoyImage.addTapGesture { [ self] in
            self.histoyImageClicked?()
        }
    }
}
