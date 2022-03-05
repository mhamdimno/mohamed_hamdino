//
//  UIViewController+Extentions.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit

extension UIViewController {
  
    class func instantiateFromXIB() -> Self{
        return Self(nibName: String(describing: self), bundle: nil)
    }
  
    var toNavigation:UINavigationController{
        return UINavigationController(rootViewController: self)
    }
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) -> Void in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
