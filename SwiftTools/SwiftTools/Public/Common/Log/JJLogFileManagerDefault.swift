//
//  JJLogFileManagerDefault.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import CocoaLumberjack

class JJLogFileManagerDefault: DDLogFileManagerDefault {

    
    override func isLogFile(withName fileName: String) -> Bool {
        return true
    }
    
    override var newLogFileName: String{
        get{
            let current = Date.formattedDateString(Date(), .type_yyyyMMdd)
            let keyName = "Log_" + "userId" + "_" + current + ".log"
            return keyName
        }
    }
    
    
    
    //更新名字
    func updateLogFileName() {
        let current = Date.formattedDateString(Date(), .type_yyyyMMdd)
        let oldName = "Log_" + "userId" + "_" + current + ".log"
        
        let oldLogName = JJFileManager.logsPath() + "\\" + oldName
        let keyName = "Log_" + "2123131" + "_" + current + ".log"
        let logNewName = JJFileManager.logsPath() + "\\" + keyName
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: oldLogName) {
            do {
                try fileManager.moveItem(atPath: oldLogName, toPath: logNewName)
            } catch {
                print("rename logfile fail")
                DDLogError("rename logfile fail")
            }
        }
    }
    
    
    
    
    
    
    
    
}
