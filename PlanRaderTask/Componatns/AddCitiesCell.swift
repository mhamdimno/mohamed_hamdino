//
//  AddCitiesCell.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit

class AddCitiesCell: UITableViewCell {
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelCityId: UILabel!
    
    var addCitiesModel: CityListModel? {
        didSet {
            guard let data = addCitiesModel else {
                return
            }
            labelCityName.text = data.name
            labelCityId.text = ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
