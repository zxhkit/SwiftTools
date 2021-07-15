//
//  Date+Extra.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation

enum JJDateFormatterType {
    case type_yyyyMMdd     // yyyyMMdd
    case type_yyyyMMdd_line   // yyyy-MM-dd
}


extension Date {
    
    static func formattedDateString(_ date: Date, _ type:JJDateFormatterType) -> String {
        let dateFormatter = DateFormatter()
        let str = Date.forrmatString(type)
        dateFormatter.dateFormat = str
        
        return dateFormatter.string(from: date)
    }
    
    
    
    
    
    
    
    
    static func forrmatString(_ type:JJDateFormatterType) -> String {
        
        var formatter = ""
        if type == .type_yyyyMMdd {
            formatter = "yyyyMMdd";
        }else if type == .type_yyyyMMdd_line {
            formatter = "yyyy-MM-dd";
       
        
        
        
        }else{
            formatter = "yyyyMMdd";
        }
        return formatter
    }
    
    
}






