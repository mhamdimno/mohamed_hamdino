//
//  MainCoordinator.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//



import UIKit

class Coordinator {
 
  class func start() {
      UIApplication.window?.rootViewController=HomeTableViewController.instantiate().toNavigation
    }

}
