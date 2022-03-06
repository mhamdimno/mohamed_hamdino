//
//  CustomImage.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit


class CustomImage: UIImageView {
    
}

class WeatherImage: CustomImage {
    override func awakeFromNib() {
        super.awakeFromNib()
        setHeight(constant: 100)
        setWidth(constant: 100)
    }
    
}
class HistoryImage: CustomImage {
    override func awakeFromNib() {
        super.awakeFromNib()
        setHeight(constant: 28)
        setWidth(constant: 28)
        tintColor=DesignSystem.Colors.helper.color
    }
    
}
