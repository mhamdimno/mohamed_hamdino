//
//  UIBundle+Extention.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.

//

import UIKit


extension UIApplication {
    
    class  var topVC:UIViewController?{
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow}?.visibleViewController
    }
    
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    

  class var window: UIWindow? {
     let ref=UIApplication.shared.delegate as! AppDelegate
      return ref.window
    }

}
