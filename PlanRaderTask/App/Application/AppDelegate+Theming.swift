//
//  AppDelegate+Theming.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//


import UIKit

extension AppDelegate{

    func setupApperance() {
        if #available(iOS 15.0, *) {
            let custom = UINavigationBarAppearance()
            custom.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = custom
            UINavigationBar.appearance().scrollEdgeAppearance = custom
            UINavigationBar.appearance().compactAppearance = custom
            UINavigationBar.appearance().compactScrollEdgeAppearance = custom
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    
}
