//
//  AppDelegate+Theming.swift
//  Fleez
//
//  Created by A One Way To Allah on 10/13/21.
//  Copyright © 2021 A One Way To Allah. All rights reserved.
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
