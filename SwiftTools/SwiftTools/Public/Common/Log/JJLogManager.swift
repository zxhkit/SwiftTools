//
//  JJLogManager.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import CocoaLumberjack



class JJLogManager: NSObject {

    static let shared = JJLogManager()
    
    static let ddLogLevel:DDLogLevel = DDLogLevel.warning
    
    private override init() { }
    
    func config() {
        
        
        let fmt = JJLogFormatter()
        
        DDOSLogger.sharedInstance.logFormatter = fmt
        DDLog.add(DDOSLogger.sharedInstance, with: DDLogLevel.all)

//        DDLog.add(DDOSLogger.sharedInstance) // Uses os_log
        
//        let fileLogger1:DDFileLogger = DDFileLogger(logFileManager: DDLogFileManager)
        // DDFileLogger，你的日志语句将写入到一个文件中，默认路径在沙盒的Library/Caches/Logs/目录下，文件名为bundleid+空格+日期.log。
        let fileLogger:DDFileLogger = DDFileLogger(logFileManager: JJLogFileManagerDefault())
        
        DDLog.add(fileLogger, with: DDLogLevel.debug)
        
        fileLogger.logFormatter = fmt
        fileLogger.rollingFrequency = 60 * 60 * 24
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
        
//        DDLogVerbose("Verbose")
//        DDLogDebug("Debug")
//        DDLogInfo("Info")
//        DDLogWarn("Warn")
//        DDLogError("Error")
        
    }
    
        
        
    
        
    
        
        
        
        
        
        
}
