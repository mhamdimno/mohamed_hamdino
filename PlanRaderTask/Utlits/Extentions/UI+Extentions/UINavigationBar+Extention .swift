//
//  UIBundle+Extention.swift
//  Fleez
//
//  Created by A One Way To Allah on 10/10/21.
//  Copyright © 2021 A One Way To Allah. All rights reserved.
//

import UIKit


extension UINavigationController{
    
    func popViewControllerss(popViews: Int, animated: Bool = true) {
        if self.viewControllers.count > popViews
        {
            let vc = self.viewControllers[self.viewControllers.count - popViews - 1]
            self.popToViewController(vc, animated: animated)
        }
    }
    
    
  
    
    func pop(transitionType type: String = CATransitionType.fade.rawValue, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: type, duration: duration)
        self.popViewController(animated: false)
    }
    
    
    func push(viewController vc: UIViewController, transitionType type: String = CATransitionType.fade.rawValue, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: CATransitionType.moveIn.rawValue, duration: duration)
        self.pushViewController(vc, animated: false)
    }
    func pushMove(_ vc: UIViewController,  _ dir: CATransitionSubtype = .fromTop) {
        self.addTransition(transitionType: CATransitionType.moveIn.rawValue,subtype: dir.rawValue, duration: KdurnationAnimation)
        self.pushViewController(vc, animated: false)
    }
    
    func defaultPop(transitionType type: String = CATransitionType.fade.rawValue, duration: CFTimeInterval = KdurnationAnimation) {
        self.popViewController(animated: true)
    }
    
    func popMove(dir: CATransitionSubtype = .fromBottom) {
        self.addTransition(transitionType: CATransitionType.moveIn.rawValue,subtype: dir.rawValue, duration: KdurnationAnimation)
        
        self.popViewController(animated: false)
    }
    
   
    func defaultPush(_ vc: UIViewController) {

        self.addTransition(transitionType: CATransitionType.moveIn.rawValue,subtype:   CATransitionSubtype.fromLeft.rawValue, duration: KdurnationAnimation)
        self.pushViewController(vc, animated: false)
    }
    
    
   
    private func addTransition(transitionType type: String = CATransitionType.fade.rawValue,subtype: String = CATransitionSubtype.fromBottom.rawValue, duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType(rawValue: type)
        transition.subtype = CATransitionSubtype(rawValue: subtype)
        self.view.layer.add(transition, forKey: nil)
    }
    
}
