//
//  UINavigationController.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.

//

import UIKit

extension UINavigationController {
    public func makeTransparent(withTint tint: UIColor = .white) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = tint
        navigationBar.titleTextAttributes = [.foregroundColor: tint]
        setNavigationBarHidden(false, animated: true)
    }
    public func presentThemeNavigationBar() {
        setNavigationBarHidden(false, animated: false)
        navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default), for: UIBarMetrics.default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()

    }
}
