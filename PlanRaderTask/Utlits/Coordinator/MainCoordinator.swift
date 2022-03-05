//
//  MainCoordinator.swift
//  WeatherLogger
//
//  Created by Maksim Kalik on 12/9/20.
//

import UIKit

class Coordinator {
 
  class func start() {
        let vc=WeatherTableViewController.instantiateFromXIB()
        UIApplication.window?.rootViewController=vc.toNavigation
    }

}
