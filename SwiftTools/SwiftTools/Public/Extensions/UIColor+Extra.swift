//
//  UIColor+Extra.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation

extension UIColor {
    
    static func colorLightDark(_ light:String,_ lightAlpha:CGFloat = 1,_ dark:String,_ darkAlpha:CGFloat = 1) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .light {
                    return UIColor.hexString(light, lightAlpha)
                }else{
                    return UIColor.hexString(dark, darkAlpha)
                }
            }
        } else {
            return UIColor.hexString(light, lightAlpha)
        }
    }
    
    /// 根据十六进制文字创建颜色
    class func hexString(_ hexString:String,_ alpha:CGFloat = 1) -> UIColor {
        //处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let length = (cString as NSString).length
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){//错误处理
            return UIColor.white
        }
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        //字符串截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0 //存储转换后的数值
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
    }
    
    
    class func jj_rgbColor(red: CGFloat,
                        green: CGFloat,
                        blue: CGFloat) -> UIColor {
        
        let red = red / 255.0
        let green = green / 255.0
        let blue = blue / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    //随机颜色
    class func jj_randomColor () -> UIColor {
        let r = arc4random() % 255
        let g = arc4random() % 255
        let b = arc4random() % 255
        
        let red = CGFloat(r)/255.0
        let green = CGFloat(g)/255.0
        let blue = CGFloat(b)/255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    /// 根据RGB值创建颜色
    class func RGB(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat ,_ alpha:CGFloat = 1) -> UIColor {
        //处理数值
        var redC:CGFloat = red
        var greenC:CGFloat = green
        var blueC:CGFloat = blue
        var alphaC:CGFloat = alpha
        
        if redC > 255.0 {
            redC = 255.0
        }
        if redC < 0 {
            redC = 0
        }
        if greenC > 255.0 {
            greenC = 255.0
        }
        if greenC < 0 {
            greenC = 0
        }
        if blueC > 255.0 {
            blueC = 255.0
        }
        if blueC < 0 {
            blueC = 0
        }
        if alphaC > 1 {
            alphaC = 1
        }
        if alphaC < 0 {
            alphaC = 0
        }
        return UIColor(red: redC/255.0, green: greenC/255.0, blue: blueC/255.0, alpha: alphaC)

//        if red > 255.0 || red < 0 || green > 255.0 || green < 0  || blue > 255.0 || blue < 0 || alpha > 1 || alpha < 0 {
//            //颜色设置错误弹窗，可删除
//            return UIColor.white
//        }else{
//            return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
//        }
    }
    
    
    
    
    
    
}



























