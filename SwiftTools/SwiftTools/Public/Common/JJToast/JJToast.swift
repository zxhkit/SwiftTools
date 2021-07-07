//
//  JJToast.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/7.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJToast: JJBaseToast {

    class func showMessage(_ message: String, view: UIView) {
        if message.isEmpty {
            return
        }
        
        let hud = show(message, view, true, UIColor(white: 0, alpha: 0.8))
        hud.mode = MBProgressHUDMode.text
    }
    
    class func showMessage(_ message: String) {
        let hud = show(message, nil, true, UIColor(white: 0, alpha: 0.8))
        hud.mode = MBProgressHUDMode.text
    }
    
    
    
    class func showSuccess(_ message: String, view: UIView) {
        let hud = show(message, view, true, UIColor(white: 0, alpha: 0.8))
        hud.mode = MBProgressHUDMode.customView
        hud.minSize = CGSize(width: 90, height: 90)
        hud.customView = JJCustomView(image: UIImage(named: "success"))
    }
    
    
    
    class func showError(_ message: String, view: UIView) {
        let hud = show(message, view, true, UIColor(white: 0, alpha: 0.8))
        hud.mode = MBProgressHUDMode.customView
        hud.minSize = CGSize(width: 90, height: 90)
        hud.customView = JJCustomView(image: UIImage(named: "error"))
    }
    
    
    class func showGif(_ imageNames: [String], title: String, view: UIView){
        let hud = show(title, view, true, nil)
        hud.mode = MBProgressHUDMode.customView
        hud.minSize = CGSize(width: 90, height: 90)
        
        /*
         MBProgressHUD *hud = [self show:title view:view isAutoHidden:YES withBezelViewColor:nil];
         hud.mode = MBProgressHUDModeCustomView;
         hud.minSize = CGSizeMake(90, 90);
         KLCustomView *imagesView = [[KLCustomView alloc] init];
         NSMutableArray *imageArray = [[NSMutableArray alloc] init];
         
         for (NSString *imageName in imageNames) {
             [imageArray addObject:[UIImage imageNamed:imageName]];
         }
         imagesView.animationDuration = 0.3;
         
         imagesView.animationImages = imageArray;
         // 开始播放
         [imagesView startAnimating];
         hud.customView = imagesView;
         */
    }
    
    
    /*
     ///< 自定义透明加载图
     + (void)showLoadingToView:(UIView *)view{
         
         MBProgressHUD *hud = [self show:nil view:view isAutoHidden:NO withBezelViewColor:[UIColor clearColor]];
         hud.mode = MBProgressHUDModeCustomView;
         hud.minSize = CGSizeMake(90, 90);
         KLCustomView *imagesView = [[KLCustomView alloc] init];
         NSMutableArray *imageArray = [[NSMutableArray alloc] init];
         for (int i = 31; i < 79; i++) {
             NSString *imageName= [NSString stringWithFormat:@"kl_app_loading_released_%03d",i];
             [imageArray addObject:[UIImage imageNamed:imageName]];
         }
         imagesView.animationDuration = 0.75;
         
         imagesView.animationImages = imageArray;
         // 开始播放
         [imagesView startAnimating];
         hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
         hud.customView = imagesView;
         hud.bezelView.backgroundColor = [UIColor clearColor];
         
     }
     */
    
    
    
    
    
    
    class func hideHUD(view: UIView?){
        if view == nil {
            MBProgressHUD.hide(for: UIApplication.shared.keyWindow!, animated: true)
        }else{
            MBProgressHUD.hide(for: view!, animated: true)
        }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
