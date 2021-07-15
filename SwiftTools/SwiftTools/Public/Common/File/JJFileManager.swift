//
//  JJFileManager.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJFileManager: NSObject {
        
    
    
    /*
     沙盒结构:
     "应用程序包"
     Documents
     Library
         Caches
         Preferences
     tmp
     
     
     Documents/保存应用程序的重要数据文件和用户数据文件等。用户数据基本上都放在这个位置(例如从网上下载的图片或音乐文件)，该文件夹在应用程序更新时会自动备份，在连接iTunes时也可以自动同步备份其中的数据。
     Library：这个目录下有两个子目录,可创建子文件夹。可以用来放置您希望被备份但不希望被用户看到的数据。该路径下的文件夹，除Caches以外，都会被iTunes备份.
     Library/Caches:保存应用程序使用时产生的支持文件和缓存文件(保存应用程序再次启动过程中需要的信息)，还有日志文件最好也放在这个目录。iTunes 同步时不会备份该目录并且可能被其他工具清理掉其中的数据。
     Library/Preferences: 保存应用程序的偏好设置文件。NSUserDefaults类创建的数据和plist文件都放在这里。会被iTunes备份。
     tmp: 保存应用运行时所需要的临时数据。不会被iTunes备份。iPhone重启时，会被清空。

     
     
     */
    /// 获取沙盒Document路径
    static func documentPath() -> String {
        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        //let path = NSHomeDirectory() + "/Documents"
        return documentPath.first ?? ""
    }
    
    static func libraryPath() -> String {
        let libraryPath1 = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        // let libraryPath2 = NSHomeDirectory() + "/Library"
        return libraryPath1.first ?? ""
 }
    
    static func cachePath() -> String {
        let cachePaths1 = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        // let cachePaths2 = NSHomeDirectory() + "/Library/Caches"
        return cachePaths1.first ?? ""
     }
    
    static func tmpPath() -> String {
        let tempPath = NSTemporaryDirectory()
        return tempPath
    }
    
    static func homePath() -> String {
        let homePath = NSHomeDirectory()
        return homePath
    }
    
    // MARK: - Log目录
    class func logsPath() -> String {
        let fileManager = FileManager.default
        let logsPath = self.cachePath() + "/Logs"
        if fileManager.fileExists(atPath: logsPath) {
            return logsPath
        } else {
            try? fileManager.createDirectory(atPath: logsPath, withIntermediateDirectories: true, attributes: nil)
            return logsPath
        }
    }
    
    class func getLogFiles() -> [String] {
        let fileManager = FileManager.default
        let logFiles = fileManager.subpaths(atPath: self.logsPath()) ?? []
        return logFiles
    }
    
    

}
