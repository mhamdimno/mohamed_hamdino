//
//  Animation.swift
//  DesignSystem
//
//  Created by A One Way To Allah on 10/5/21.
//

import UIKit


extension DesignSystem{
    
    enum Animation  {
        case easeIn(d:AnimationDuration)
        var animator:UIViewPropertyAnimator{
            switch self {
            case .easeIn(let d):
                return UIViewPropertyAnimator(duration: d.timeInterval, timingParameters: AnimationTiming.easeIn.curve)
            
            }
        }
        
    }
}
