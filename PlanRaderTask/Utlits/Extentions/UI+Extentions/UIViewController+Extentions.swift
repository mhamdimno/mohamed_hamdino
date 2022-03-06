//
//  UIViewController+Extentions.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit

extension UIViewController {
  
    class func instantiate() -> Self{
        return instantiateFromStoryboardHelper()
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>() -> T
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
    var toNavigation:UINavigationController{
        return UINavigationController(rootViewController: self)
    }
    func to(_ vc:UIViewController){
        self.navigationController?.defaultPush( vc)
    }
    
    func replace(_ vc:UIViewController){
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    func show(_ vc:UIViewController){
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    func move(_ vc:UIViewController){
        self.navigationController?.pushMove(vc)
    }
    func pop(){
            self.navigationController?.defaultPop()
    }
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) -> Void in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
