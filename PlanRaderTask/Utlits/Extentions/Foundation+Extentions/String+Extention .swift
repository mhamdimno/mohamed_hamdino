//
//  UIBundle+Extention.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.

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
