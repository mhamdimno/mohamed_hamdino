//
//  Colors.swift
//  DesignSystem
//
//  PlanRaderTask
//  Created by A One Way To Allah on 05/03/2022.

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
