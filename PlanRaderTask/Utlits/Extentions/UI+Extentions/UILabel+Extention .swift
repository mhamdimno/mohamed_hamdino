//
//  UIBundle+Extention.swift
//  Fleez
//
//  Created by A One Way To Allah on 10/10/21.
//  Copyright © 2021 A One Way To Allah. All rights reserved.
//

import UIKit
extension UILabel{
    
    func set(_ str: String?){
        text = str ?? ""
    }
    func setCityInfoData(name: String?,date:String){
        if let name=name{
            self.text="Weather information for \(name) received on \(date)"
        }else{
            text=""
        }
    }
    func setDescription(_ str: String?){
        if let str=str{
            self.text="\("Description"): \(str)"
        }else{
            text=""
        }
    }
    
    func setTemp(_ str: Double?){
        if let str=str{
            self.text="\("Temp"): \(str) C"
        }else{
            text=""
        }
    }
    
    func setHumidity(_ str: Int?){
        if let str=str{
            self.text="\("Humidity"): \(str) %"
        }else{
            text=""
        }
    }
    
    
    func setWindSpeed(_ str: Double?){
        if let str=str{
            self.text="\("WindSpeed"): \(str)mh"
        }else{
            text=""
        }
    }
    
    
}
