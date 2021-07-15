//
//  JJLogFormatter.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import CocoaLumberjack

class JJLogFormatter: NSObject,DDLogFormatter {
    func format(message logMessage: DDLogMessage) -> String? {
        var logLevel = ""
        switch logMessage.flag {
        case .error:
            logLevel = "🔴[Error] -> "
        case .warning:
            logLevel = "🔶[Warning] -> "
            
        case .info:
            logLevel = "🔷[Info] -> "
            
        case .debug:
            logLevel = "◽️[Debug] -> "
            
        default:
            logLevel = "◾️[Verbose] -> "
        }
        
        let function = logMessage.function ?? " "
        let line = String(logMessage.line)
        
        
        let formatterString = getCurrentTimes()  + " " + logLevel + "[" + function + "]" + "[line:" + line + "] >>>>>>\n" + logMessage.message
                
        return formatterString
    }
    
}


private func getCurrentTimes() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
    let current = formatter.string(from: Date())
    return current
}
