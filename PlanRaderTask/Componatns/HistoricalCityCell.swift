//
//  HistoricalCityCell.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//


import UIKit
class HistoricalCityCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!

    var WeatherInfoModel: WeatherInfo? {
        didSet {
            guard let data = WeatherInfoModel else {
                return
            }
            dateLabel.set(data.date)
            infoLabel.setHistorcilInfoData(status: data.statue, temp: data.degree)

        }
    }

  
}
