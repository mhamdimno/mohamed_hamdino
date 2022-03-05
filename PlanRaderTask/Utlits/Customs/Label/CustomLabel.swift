

import UIKit

class CustomLabel:  UILabel{
    
    @IBInspectable var horizintalPadding: CGFloat = 0
    @IBInspectable var verticalPadding: CGFloat = 0
    
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: verticalPadding, left: horizintalPadding, bottom: verticalPadding, right: horizintalPadding)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + horizintalPadding + horizintalPadding,
                      height: size.height + verticalPadding + verticalPadding)
    }
    
    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (horizintalPadding + horizintalPadding)
        }
    }
    
    //for label Proberties
    fileprivate func setProberties(txtColor:UIColor =  DesignSystem.Colors.dark.color,textAlignment:NSTextAlignment = .natural,bgColor:UIColor =  .clear,horzintalPadding:CGFloat=0,verticalPadding:CGFloat=0, borderColor:UIColor =  .clear,borderWidth:CGFloat=0,cornerRaduis:CGFloat=0,height:CGFloat=0,width:CGFloat=0){
        
        self.textColor = textColor
        
        if textAlignment != .natural{
            self.textAlignment = textAlignment
        }
        
        if borderWidth != 0{
            self.layer.borderWidth=borderWidth
        }
        
        if borderColor != .clear{
            self.layer.borderColor = borderColor.cgColor
        }
        if bgColor != .clear{
            self.backgroundColor = bgColor
        }
        
        if cornerRaduis != 0 {
            self.layer.cornerRadius = cornerRaduis
        }
        
        clipsToBounds = true
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
                textColor = DesignSystem.Colors.dark.color
        self.isUserInteractionEnabled=true
        self.text=self.text?.capitalized
        layer.masksToBounds = false
        clipsToBounds = false
        
    }
    
}


