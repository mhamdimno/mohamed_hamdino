//
//  UILabels.swift
//  PlanRaderTask
//
//  Created by A One Way To Allah on 05/03/2022.
//

import Foundation

class TitleLabel: CustomLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = DesignSystem.Typography.title.font
       self.setProberties(txtColor: DesignSystem.Colors.primary.color)
    }
    
}

class BodyLabel: CustomLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = DesignSystem.Typography.body.font
    }
    
}

class HeadlineLabel: CustomLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = DesignSystem.Typography.headline.font
    }
    
    
}
