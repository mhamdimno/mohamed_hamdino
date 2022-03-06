//
//  UIBundle+Extention.swift
//  Fleez
//
//  Created by A One Way To Allah on 10/10/21.
//  Copyright © 2021 A One Way To Allah. All rights reserved.
//

import UIKit
extension UIImageView{
    func set(_ imageName: String?){
        self.image=imageName?.toImage
    }
    func addImage(){
         
         var height:CGFloat=10
         var x:CGFloat = 16
            let size:CGFloat=30
            x=UIScreen.main.bounds.width - 24 - size
       
         if UIDevice.withNotch{
             height=50
         }
         self.frame=CGRect(x: x, y: height, width: size, height: size)
     }
    
}
extension UIDevice {
    class var withNotch: Bool {
        return UIScreen.main.bounds.height > 800 && UIDevice.isPhone

    }
    class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}

