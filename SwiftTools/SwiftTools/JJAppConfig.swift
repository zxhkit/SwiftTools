//
//  JJAppConfig.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/29.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation
import UIKit

let KScreenWidth = UIScreen.main.bounds.size.height < UIScreen.main.bounds.size.width ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width
let KScreenHeight = UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width

let kIs_iPhone_X = KScreenHeight == 812.0 || KScreenHeight == 896.0 || KScreenHeight == 844.0 || KScreenHeight == 926.0 || KScreenHeight == 780.0



let kTabBarHeight = kIs_iPhone_X ? 83 : 49
let kNavBarHeight = kIs_iPhone_X ? 88 : 64
let kNavBarContentHeight = 44
let kStatusBarHeight = kIs_iPhone_X ? 44 : 20
let kBottomSafeHeight = kIs_iPhone_X ? 34 : 0




























































