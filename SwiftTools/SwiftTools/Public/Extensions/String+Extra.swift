//
//  String+Extra.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation

extension String {
    
    func toPinyin() -> String {
        let str = NSMutableString(string: self)
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformMandarinLatin, false)
        CFStringTransform(str as CFMutableString, nil, kCFStringTransformStripDiacritics, false)
        let pinyin = str.capitalized
        return pinyin
    }
    
    var base64EncodedString: String? {
        get {
            let data = self.data(using: .utf8)
            return data?.base64EncodedString()
        }
    }
    
    func width(_ font:UIFont, _ height: CGFloat) -> CGFloat {
        let attributes = [NSAttributedString.Key.font:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: CGSize(width: 100000, height: height), options: option, attributes: attributes, context: nil)
        return rect.size.width
    }
    
    func height(_ font:UIFont, _ width: CGFloat) -> CGFloat {
        let attributes = [NSAttributedString.Key.font:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: CGSize(width: width, height: 100000), options: option, attributes: attributes, context: nil)
        return rect.size.width
    }
    
    /** 提取字符串中的字母、数字和汉字 */
    func filterStringSpecialStr() -> String {
        let regex = "[^a-zA-Z0-9\\u4e00-\\u9fa5]"
        let str = self.replacingOccurrences(of: regex, with: "", options:CompareOptions.literal , range: nil)
        
        return str
    }

    
}
