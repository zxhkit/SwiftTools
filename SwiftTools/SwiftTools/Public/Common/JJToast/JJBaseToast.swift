//
//  JJBaseToast.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/7.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJBaseToast: MBProgressHUD {

    var vv:UIView?
    
    class func show(_ text:String,_ view: UIView?, _ isAutoHidden: Bool,_ bezelViewColor:UIColor?) -> MBProgressHUD {
        
        var baseView = view
        
        if view == nil {
            baseView = UIApplication.shared.keyWindow
        }
        
        MBProgressHUD.hide(for: baseView!, animated: true)
        
        // 快速显示一个提示信息
        let hud = MBProgressHUD.showAdded(to: baseView!, animated: true)
        //间距调整
        hud.margin = 15
        //文字
        hud.label.text = text
        hud.label.font = UIFont.systemFont(ofSize: 14)

        //支持多行
        hud.label.numberOfLines = 0
        //隐藏时候从父控件移除
        hud.removeFromSuperViewOnHide = true
        
        hud.contentColor = UIColor.white
        if bezelViewColor == nil {
            hud.bezelView.backgroundColor = UIColor(white: 0, alpha: 0.8)
            hud.bezelView.style = MBProgressHUDBackgroundStyle.blur
        }else{
            hud.bezelView.backgroundColor = bezelViewColor
            hud.bezelView.color = bezelViewColor
            hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor
        }
        hud.bezelView.layer.masksToBounds = true
        hud.bezelView.layer.cornerRadius = 10
        if isAutoHidden {
            hud.hide(animated: true, afterDelay: 2)
        }
        
        return hud
    }
    
    
    
    
    
    
    
    
    
    
    
}
