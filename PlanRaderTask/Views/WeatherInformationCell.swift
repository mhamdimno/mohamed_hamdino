//
//  WeatherInformationCell.swift
//  Weather
//
//  Created by Nischal Hada on 6/19/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class WeatherInformationCell: UITableViewCell {
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelCityTemperature: UILabel!

    var WeatherModel: City? {
        didSet {
            guard let data = WeatherModel else {
                return
            }
            labelCityName.text = data.name
            //labelCityTemperature.text = "\(data.temp ?? 0) °C"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
