//
//  Animation.swift
//  DesignSystem
//
//  PlanRaderTask
//  Created by A One Way To Allah on 05/03/2022.
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
