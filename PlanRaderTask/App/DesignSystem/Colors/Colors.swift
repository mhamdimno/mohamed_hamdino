//
//  Colors.swift
//  DesignSystem
//
//  Created by A One Way To Allah on 9/30/21.
//

import UIKit


extension DesignSystem{
    
    enum Colors:String {
       
        case light
        case dark
        case primary
        case helper

        var color:UIColor{
            return UIColor(named: self.rawValue) ?? .purple
        }
    }
    
    
}
