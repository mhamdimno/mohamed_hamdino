//
//  AnimationTiming.swift
//  DesignSystem
//
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import UIKit


enum AnimationTiming {
    case easeIn
    case easeOut
    case easeInOut
    case spring (velocity: CGVector)

    var curve: UITimingCurveProvider {
        switch self {
        case .easeIn:
            return UICubicTimingParameters(controlPoint1: CGPoint(x: 0.5, y: 0), controlPoint2: CGPoint(x: 1, y: 1))
        case .easeOut:
            return UICubicTimingParameters(controlPoint1: CGPoint(x: 0, y: 0), controlPoint2: CGPoint(x: 0.4, y: 1))
        case .easeInOut:
            return UICubicTimingParameters(controlPoint1: CGPoint(x: 0.45, y: 1), controlPoint2: CGPoint(x: 0.4, y: 1))
        case .spring(let velocity):
            return UISpringTimingParameters(mass: 1.8, stiffness: 330, damping: 33, initialVelocity: velocity)
        }
    }
}
