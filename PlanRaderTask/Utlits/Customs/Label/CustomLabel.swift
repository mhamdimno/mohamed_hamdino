

import UIKit

class CustomLabel:  UILabel{
    
    
    //for label Proberties
     func setProberties(txtColor:UIColor ,textAlignment:NSTextAlignment = .natural,bgColor:UIColor =  .clear,horzintalPadding:CGFloat=0,verticalPadding:CGFloat=0, borderColor:UIColor =  .clear,borderWidth:CGFloat=0,cornerRaduis:CGFloat=0,height:CGFloat=0,width:CGFloat=0){
        
        self.textColor = txtColor
        
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


