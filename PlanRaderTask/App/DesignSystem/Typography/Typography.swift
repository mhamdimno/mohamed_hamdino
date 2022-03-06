//
//  Typography.swift
//  DesignSystem
//
//  PlanRaderTask
//  Created by A One Way To Allah on 05/03/2022.
import UIKit

extension DesignSystem{
    
    enum Typography :String {
        case title
        case headline
        case body

        private var fontDescription: CustomFontDescriptor {
              switch self {
              case .title:
                return CustomFontDescriptor(font: .semiBold, size: 18, style: .title1)
              case .headline:
                return CustomFontDescriptor(font: .semiBold, size: 14, style: .headline)
              case .body:
                return CustomFontDescriptor(font: .semiBold, size:  12, style: .body)
             
              }
          }
        var font:UIFont{
            guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
                      return UIFont.preferredFont(forTextStyle: fontDescription.style)
                  }
                  let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
                  return fontMetrics.scaledFont(for: font)
        }
    }
}
