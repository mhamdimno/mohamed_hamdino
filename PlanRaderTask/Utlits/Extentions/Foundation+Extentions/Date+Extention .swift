//
//  UIBundle+Extention.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.

//

import Foundation


extension Date{
    
    var getTimeStringFromDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale=Locale(identifier: "en")
        let dataString = dateFormatter.string(from: self)
        return dataString
    }
    
}
