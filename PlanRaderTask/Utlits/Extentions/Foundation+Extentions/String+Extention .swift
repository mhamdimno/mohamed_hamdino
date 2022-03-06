//
//  UIBundle+Extention.swift
//  Fleez
//
//  Created by A One Way To Allah on 10/10/21.
//  Copyright © 2021 A One Way To Allah. All rights reserved.
//

import UIKit

extension String{
    var decodeUrl : String{
        return self.removingPercentEncoding ?? ""
    }
    
    var toImage:UIImage{
        return UIImage(named: self) ?? UIImage()
    }
    var toSystemImage:UIImage{
        return UIImage(systemName: self) ?? UIImage()
    }
}
