//
//  Animation.swift
//  DesignSystem
//
//  Created by A One Way To Allah on 10/5/21.
//

import Foundation

//duration
//behaviror ex ease in out fade

enum AnimationDuration: TimeInterval {
    case microFast = 0.1
    case microRegular = 0.2
    case microSlow = 0.3

    case macroFast = 0.4
    case macroRegular = 0.5
    case macroSlow = 0.6
    
    var timeInterval: TimeInterval {
        return rawValue
    }
}
