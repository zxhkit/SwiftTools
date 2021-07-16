//
//  JJAppConfig.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/29.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation
import UIKit
import CocoaLumberjack

let KScreenWidth:Int = Int(UIScreen.main.bounds.size.height < UIScreen.main.bounds.size.width ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width)
let KScreenHeight:Int = Int(UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width)

let kIs_iPhone_X = KScreenHeight == 812 || KScreenHeight == 896 || KScreenHeight == 844 || KScreenHeight == 926 || KScreenHeight == 780



let kTabBarHeight = kIs_iPhone_X ? 83 : 49
let kNavBarHeight = kIs_iPhone_X ? 88 : 64
let kNavBarContentHeight = 44
let kStatusBarHeight = kIs_iPhone_X ? 44 : 20
let kBottomSafeHeight = kIs_iPhone_X ? 34 : 0





func JJLog<T>(_ fmt: T) {
    DDLogVerbose(T.self)
}











/*
 MarqueeLabel:  --跑马灯
 BSText:    -- YYtext: swift翻版
 Reachability.swift : --   用来检查应用当前的网络连接状况
 MonkeyKing:  --  第三方分享
 SQLite.swift:  --  数据库
 TextAttributes : --  富文本
 Atributika : --  富文本
 XCGLogger: --  日志
 SwiftyUserDefaults: --  偏好设置
 KeychainAccess: -- Keychain
 animated-tab-bar: -- 给tabbar添加动画
 adaptive-tab-bar: -- 给tabbar添加动画
 
 SwiftyStoreKit: --  封装的轻量级的APP内购框架。
 
 */











































