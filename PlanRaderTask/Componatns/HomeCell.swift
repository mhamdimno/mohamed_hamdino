//
//  WeatherInformationCell.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
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
