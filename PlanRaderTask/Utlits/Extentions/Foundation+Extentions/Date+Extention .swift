//
//  UIBundle+Extention.swift
//  Fleez
//
//  Created by A One Way To Allah on 10/10/21.
//  Copyright © 2021 A One Way To Allah. All rights reserved.
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
