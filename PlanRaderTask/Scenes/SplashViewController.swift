//
//  SplashViewController.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        start()
    }
    

    private func start(){
        DispatchQueue.main.asyncAfter(deadline: .now() + delayDurationStart) {
            Coordinator.start()
        }
    }

}
