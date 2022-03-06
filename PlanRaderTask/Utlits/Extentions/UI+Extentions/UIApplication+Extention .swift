//
//  UIBundle+Extention.swift
//  Fleez
//
//  Created by A One Way To Allah on 05/03/2022.
//  Copyright © 2022 A One Way To Allah. All rights reserved.
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
    
//    var sceneDelegate: SceneDelegate? {
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//              let delegate = windowScene.delegate as? SceneDelegate else { return nil }
//        return delegate
//    }
  class var window: UIWindow? {
     let ref=UIApplication.shared.delegate as! AppDelegate
      return ref.window
    }

}
