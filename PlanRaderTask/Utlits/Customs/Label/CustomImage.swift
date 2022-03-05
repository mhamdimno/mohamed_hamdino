//
//  CustomImage.swift
//  MySpaaai
//
//  Created by A One Way To Allah on 11/8/20.
//  Copyright © 2020 A One Way To Allah. All rights reserved.
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

