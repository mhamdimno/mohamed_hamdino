////
////  UIBundle+Extention.swift
////  Fleez
////
////  Created by A One Way To Allah on 10/10/21.
////  Copyright © 2021 A One Way To Allah. All rights reserved.
////
//
//import UIKit
//
//func set(_ str: String?){
//    text = str ?? ""
//}
//
//
//    func setdescription(_ id: String?){
//        if let id=id{
//            self.text="\("order date".loc) :\(id)"
//        }else{
//            text=""
//        }
//           
//       }
//    func settemp(_ id: String?){
//        if let id=id{
//            self.text="\("occasion date".loc) :\(id)"
//        }else{
//            text=""
//        }
//           
//       }
//    func sethumidity(_ id: String?){
//        if let id=id{
//            self.text="\("remember date".loc) :\(id)"
//        }else{
//            text=""
//        }
//           
//       }
//    
//    
//    func setTwoWithSpace(_ id: String?,_ id2: String?){
//       text="\(id ?? "") \(id2 ?? "")"
//       }
//    
//   
//    func netDateOrder(_ id: String?){
//        if let id=id{
//            self.text="\("order date".loc) :\(id.description )"
//
//        }else{
//            text=""
//        }
//           
//       }
//    
//    func neOrderPrice(_ id: AnyCodable?, _ c:String?){
//        if let id=id{
//            self.text="\("total price".loc) :\(id.description )  \(c ?? "")"
//
//        }else{
//            text=""
//        }
//           
//       }
//    
//    func netlng(){
//        if Localize.getLang()=="ar"{
//            text="العربية"
//        }else{
//            text="english"
//        }
//           
//       }
//    func netOrder2(_ id: AnyCodable?){
//        if let id=id{
//            self.text="\("Order number".loc) :\(id.description )"
//
//        }else{
//            text=""
//        }
//           
//       }
//    
//    func netdate(_ id: String?){
//        if let id=id{
//            self.text="\("order at".loc) :\(id )"
//
//        }else{
//            text=""
//        }
//           
//       }
//    func netofitems(_ id: AnyCodable?){
//        if let id=id{
//            self.text="\("number of items".loc) :\(id.description )"
//
//        }else{
//            text=""
//        }
//           
//       }
//    func nettyp(_ typ:String?){
//        if let typ=typ{
//            self.text="\("order type".loc) - \(typ)"
//        }else{
//            text=""
//        }
//           
//       }
//    
//    
//    func netKg(_ title: String?,_ value: String?,_ size: String?){
//               self.text="\(title ?? "") (\(value ?? "") \(size ?? ""))"
//
//              
//          }
//    func netdel(_ id: String?){
//           if let id=id{
//               self.text="\("delegate name".loc) \(id)"
//
//           }else{
//               text=""
//           }
//              
//          }
//    private func htmlAlim() -> String{
//        
//        if Localize.getLang()=="ar"{
//            return "right"
//
//        }else{
//            return "left"
//
//        }
//        
//       
//        
//    }
//    func htmlAttributed(_ v:String)-> NSAttributedString? {
//        do {
//
//            var vv:CGFloat=font.pointSize
//                   let htmlCSSString = "<style>" +
//                       "html *" +
//                       "{" +
//                    "font-size: \(vv.rs())pt !important;" +
//                       "color: #\(textColor.hexString) !important;" +
//                    "text-align: \(htmlAlim());" +
//
//                    "font-family: \(font.familyName), Cairo-regular !important;" +
//                   "}</style> \(v)"
//
//                   guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
//                    return nil
//                   }
//
//                  return  try NSAttributedString(data: data,
//                                                 options: [.documentType: NSAttributedString.DocumentType.html,
//                                                           .characterEncoding: String.Encoding.utf8.rawValue],
//                                                 documentAttributes: nil)
//               } catch {
//                   print("error: ", error)
//                return nil
//
//               }
//    }
//    func setHtml(_ html: String?) {
//       
//        attributedText=htmlAttributed(html ?? "")
//
//        if Localize.getLang()=="ar"{
//            //flipH()
//        }
//       }
//    
//    func netTotal(_ id: Int?){
//     if let id=id{
//         self.text="\("count :".loc) \(id)"
//
//     }else{
//         text=""
//     }
//        
//    }
//    
//    
//    
//    func setWallet(_ v: AnyCodable?){
//            if  Localize.currentLanguage().contains("ar"){
//                self.text="اجمالي رصيد المحفظة \(v?.description ?? "0") ر.س"
//
//            }else{
//                self.text="Total wallet balance \(v?.description ?? "0") SAR"
//
//            }
//            
//
//            
//        }
//    
//    
//    
//    func netHello(_ id: Int?){
//          if let id=id{
//              self.text="\("hello:".loc) \(id)"
//
//          }else{
//            text="vistor".loc
//          }
//             
//         }
//    func netvisadate(_ id: String?){
//         if let id=id{
//             self.text="\("expired date".loc) \(id)"
//
//         }else{
//             text=""
//         }
//            
//        }
//    
//    func netname(_ id: String?){
//           if let id=id{
//               self.text="\("name".loc) \(id)"
//
//           }else{
//               text=""
//           }
//              
//          }
//    
//    func netvisanum(_ id: String?){
//            if let id=id{
//                self.text="\("****  ****  **** ") \(id)"
//
//            }else{
//                text=""
//            }
//               
//           }
// 
//    
//    
//    
//    func netopen(_ is_open: Int?,_ str: String?){
//
//        if is_open==1{
//            self.textColor = .white
//        }else{
//                      self.textColor = .red
//        }
//        self.text=str ?? ""
//   
//          }
//    func netStatus(_ status: String?,_ str: String?){
//        
//        switch status {
//                case "delivered":
//                           self.backgroundColor = .white
////        case "0","3":
////                   self.backgroundColor = .Helper
////
////            case "1":
////                           self.backgroundColor = .gren
////
////            case "2":
////                           self.backgroundColor = DesignSystem.Colors.main.color
////
////
////            case "4","5":
////                                      self.backgroundColor = .red
//
//        default:
//            self.backgroundColor =  UIColor.init(hexString: "#B61C1C")
//
//        }
//
//        textColor = DesignSystem.Colors.txtlight.color
//     
//           self.text=str ?? ""
//        isHidden=str == nil
//      
//             }
//    func setPriceString(_ name: String?, _ c:String="sar".loc , isMins:Bool=false){
//        self.text="\(isMins && name?.description.extractInt ?? 0 != 0 ? "-":"")\(name?.description  ?? "") \(c)"
//       // self.text = String(format: "%.02f", name?.toDouble ?? 0).pric
//        
////        if name == nil || name?.description.extractInt ?? 1 == 0 {
////            self.text=""
////        }
//
//       }
//    func setPrice(_ name: AnyCodable?, _ c:String="sar".loc , isMins:Bool=false){
//        self.text="\(isMins && name?.description.extractInt ?? 0 != 0 ? "-":"")\(name?.description  ?? "") \(c)"
//       // self.text = String(format: "%.02f", name?.toDouble ?? 0).pric
//        
////        if name == nil || name?.description.extractInt ?? 1 == 0 {
////            self.text=""
////        }
//
//       }
//    func setPriceTax(_ name: AnyCodable?, _ c:String="sar".loc){
//        self.text="\(name?.description  ?? "") \(c) (\("tax".loc))"
//       // self.text = String(format: "%.02f", name?.toDouble ?? 0).pric
//        print("🙄extractInt \(name?.description.extractInt)")
//
////        if name == nil ||  name?.description.extractInt ?? 1 == 0 {
////            self.text=""
////        }
//
//       }
//    func setPriceFull(_ name: AnyCodable?, _ c:String?){
//        self.text="\("service price".loc) \(name?.description  ?? "") \(c ?? "sar".loc)"
//       // self.text = String(format: "%.02f", name?.toDouble ?? 0).pric
//        
//        self.isHidden=name?.description.extractInt ?? 1 == 0
//
//       }
//    func setProvider(_ id: String?){
//        if let id=id{
//            self.text="\("provider name".loc) :\(id)"
//        }else{
//            text=""
//        }
//           
//       }
//    func setBegin(_ id: String?){
//        if let id=id{
//            self.text="\("subscription start".loc) :\(id)"
//        }else{
//            text=""
//        }
//           
//       }
//    func setEnd(_ id: String?){
//        if let id=id{
//            self.text="\("subscription end".loc) :\(id)"
//        }else{
//            text=""
//        }
//           
//       }
//    
//    func netratio(_ name: AnyCodable?, _ c:String?){
//        self.text="\("app commission".loc) \(name?.description  ?? "") \(c ?? "sar".loc)"
//       // self.text = String(format: "%.02f", name?.toDouble ?? 0).pric
//        
//        self.isHidden=name?.description.extractInt ?? 1 == 0
//
//       }
//    func netOff(_ name: AnyCodable?,showPresentage:Bool=true){
//      let v=showPresentage ? "٪" : ""
//        if Localize.getLang()=="ar"{
//            self.text="خصم \( name?.description ?? "") \(v)"
//        }else{
//            self.text="off \(name?.description ?? "") \(v)"
//
//        }
//        self.isHidden=name?.description.extractInt ?? 0 == 0
//
//       }
//    
//    func netCoupon(_ coupon_value: AnyCodable?,_ coupon_code: String?,_ count:AnyCodable?){
//    
//        if Localize.getLang()=="ar"{
//            self.text="خصم \( coupon_value?.description ?? "") ٪ زيادة استخدم الكود  \(coupon_code ?? "")"
//        }else{
//            self.text="off \(coupon_value?.description ?? "") ٪ sale use code \(coupon_code ?? "")"
//
//        }
//        self.isHidden=coupon_code?.description.extractInt ?? 0 == 0 || count?.description.extractInt ?? 0 == 0
//
//       }
//    func netround(_ name: String?){
//        self.text=name?.toDouble.toInt?.pric ?? ""
//        
//    }
//    func netpriceDouble(_ name: Double?){
//           self.text=name?.pric ?? ""
//              
//          }
//    func netrat(_ name: String?){
//           self.text=name?.rat ?? ""
//              
//          }
//    
//   
//    
//    
// 
//    
//   
//  
//     func dirction(_ v:Bool=false){
//              if  Localize.currentLanguage().contains("en"){
//                textAlignment = v ? .left : .right
//                  }else{
//                textAlignment = v ? .right : .left
//
//                  }
//        }
//    
//     func dir(){
//          if  Localize.currentLanguage().contains("en"){
//                  textAlignment = .right
//              }else{
//            textAlignment = .left
//              }
//    }
//    
//    func dir2(){
//           if  Localize.currentLanguage().contains("ar"){
//                   textAlignment = .right
//               }else{
//             textAlignment = .left
//               }
//        
//        if  Localize.currentLanguage().contains("en"){
//            textAlignment = .left
//
//            }else{
//                textAlignment = .right
//
//            }
//     }
//     
//    
//     func hisStatus(_ status:String,_ status2:String){
//        switch status {
//        case "pending":
//            text=status2
//            textColor = .orange
//        case "approved":
//        text=status2
//        textColor = .green
//            case "refused":
//            text=status2
//            textColor = .red
//        default:
//            break
//        }
//    }
//    
//    
//    func offerRatio(_ v :Double?){
//        if v == nil ||  v == 0{
//            self.isHidden=true
//        }else{
//            self.text="\(v ?? 0)% \("sale".loc)"
//            self.isHidden=false
//
//        }
//    }
//    
//    
//    
//    func lng(_ v :String, _ v2:String?=nil){
//        
//        if  Localize.currentLanguage().contains("en"){
//            text=v
//        }else{
//            if v2 != nil{
//                text=v2
//            }else{
//                text=v
//                
//            }
//        }
//    }
//
//    func netCount(_ id: String?){
//        
//        isHidden = id==nil || id=="0" || id=="1"
//        if let id=id{
//            self.text="\("show all photos".loc) \(id)"
//        }
//           
//       }
//    
//    func setCountOffers(_ id: AnyCodable?){
//        
//        if let id=id{
//            if Localize.getLang()=="en"{
//                self.text="\("You have \(id.description) offers".loc)"
//            }else{
//                self.text="\("لديك \(id.description) عروض".loc)"
//            }
//            if id.description=="0"{
//                self.text="\("no offers".loc)"
//            }
//        }
//       // isHidden = id==nil || id?.description=="0"
//
//       }
//    func netCountItem(_ id: AnyCodable?){
//        
//        if let id=id{
//            self.text="\("count".loc) \(id.description )"
//        }
//           
//       }
//    
//    func netCountItemSub(_ id: Int){
//        
//        
//            if Localize.getLang()=="ar"{
//                self.text="المجموع الفرعي \(id) منتجات"
//
//            }else{
//                self.text="Subtotal \(id) items"
//
//            }
//        }
//           
//    func netBuy(_ name: AnyCodable?, _ c:String?){
//        
//        if let name=name{
//            if Localize.getLang()=="ar"{
//                self.text="شراء منتجات بسعر \(name)\(c ?? "sar".loc)"
//
//            }else{
//                self.text="buy items with price \(name)\(c ?? "sar".loc)"
//            }
//        }
//        }
//          
//      
//    
//    func addBage(count:String)->UILabel{
//        let badgeCount = UILabel(frame: CGRect(x: 8, y: -05, width: 20, height: 20))
//        badgeCount.layer.borderColor = UIColor.clear.cgColor
//        badgeCount.layer.borderWidth = 2
//        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
//        badgeCount.textAlignment = .center
//        badgeCount.layer.masksToBounds = true
//        badgeCount.textColor = .white
//        badgeCount.font = badgeCount.font.withSize(12)
//        badgeCount.backgroundColor = .red
//        badgeCount.text = count
//        return badgeCount
//    }
//    
//    func strikeThrough(_ isStrikeThrough:Bool) {
//        if isStrikeThrough {
//            if let lblText = self.text {
//                let attributeString =  NSMutableAttributedString(string: lblText)
//                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
//                self.attributedText = attributeString
//            }
//        } else {
//            if let attributedStringText = self.attributedText {
//                let txt = attributedStringText.string
//                self.attributedText = nil
//                self.text = txt
//                return
//            }
//        }
//    }
//    
//   func underline() {
//        
//        let spacing = 0 // will be added as negative bottom margin for more spacing between label and line
//        let line = UIView()
//        line.translatesAutoresizingMaskIntoConstraints = false
//    line.backgroundColor = textColor
//        self.addSubview(line)
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[line]|", metrics: nil, views: ["line":line]))
//        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(1)]-(\(-spacing))-|", metrics: nil, views: ["line":line]))
//        
//    }
//    
//    @objc func setFontSwizzled(font: UIFont) {
//        if self.shouldOverride() {
//            self.setFontSwizzled(font: DesignSystem.Typography.sb12.font)
//        } else {
//            self.setFontSwizzled(font: font)
//        }
//    }
//    
//    private func shouldOverride() -> Bool {
//        let classes = ["UIDatePicker", "UIDatePickerWeekMonthDayView", "UIDatePickerContentView"]
//        var view = self.superview
//        while view != nil {
//            let className = NSStringFromClass(type(of: view!))
//            if classes.contains(className) {
//                return true
//            }
//            view = view!.superview
//        }
//        return false
//    }
//    
//    private static let swizzledSetFontImplementation: Void = {
//        let instance: UILabel = UILabel()
//        let aClass: AnyClass! = object_getClass(instance)
//        let originalMethod = class_getInstanceMethod(aClass, #selector(setter: font))
//        let swizzledMethod = class_getInstanceMethod(aClass, #selector(setFontSwizzled))
//        
//        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
//            // switch implementation..
//            method_exchangeImplementations(originalMethod, swizzledMethod)
//        }
//    }()
//    
//    static func swizzleSetFont() {
//        _ = self.swizzledSetFontImplementation
//    }
//    
//    func underlineMyText(range1:String, range2:String) {
//        if let textString = self.text {
//            
//            let str = NSString(string: textString)
//            let firstRange = str.range(of: range1)
//            let secRange = str.range(of: range2)
//            let attributedString = NSMutableAttributedString(string: textString)
//            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: firstRange)
//            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: secRange)
//            attributedText = attributedString
//        }
//    }
//    
//    func setLineSpacing(lineSpacing: CGFloat = 8.0, textAlignment:NSTextAlignment = .right) {
//        
//        guard let labelText = self.text else { return }
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = lineSpacing
//        
//        let attributedString:NSMutableAttributedString
//        if let labelattributedText = self.attributedText {
//            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
//        } else {
//            attributedString = NSMutableAttributedString(string: labelText)
//        }
//        
//        // (Swift 4.2 and above) Line spacing attribute
//        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
//        
//        
//        // (Swift 4.1 and 4.0) Line spacing attribute
//        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
//        
//        self.attributedText = attributedString
//        
//        self.textAlignment = textAlignment
//        
//    }
//}
