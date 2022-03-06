//
//  ProgressHUD.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.

//
import Foundation
import SVProgressHUD

protocol Progressing {
    func ShowSVProgressHUD_White()
    func ShowSVProgressHUD_Black()
    func DismissSVProgressHUD()
}

class ProgressHUD {
}

extension ProgressHUD: Progressing {

    func ShowSVProgressHUD_White() {
        SVProgressHUD.show()
    }

    func ShowSVProgressHUD_Black() {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor( UIColor.black.withAlphaComponent(0.4))
        SVProgressHUD.setForegroundColor(DesignSystem.Colors.helper.color)
        SVProgressHUD.setRingThickness( 1.0)
    }

    func DismissSVProgressHUD() {
        SVProgressHUD.dismiss()
    }
}
