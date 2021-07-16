//
//  JJEmitterViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJEmitterViewController: JJBaseViewController {
    
    var snowView:JJSnowRainView?
    var redPackertView:JJRedPackertRainView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewTitle("粒子动画")

        let btn = createCustomButton("清除", 0, CGRect(x: KScreenWidth-120, y: kStatusBarHeight, width: 80, height: kNavBarContentHeight))
        navigationCustomView.addSubview(btn)
        
        
        _ = createCustomButton("动画1", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画2", 2, CGRect(x: 120, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画3", 3, CGRect(x: 210, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画44", 4, CGRect(x: 300, y: kNavBarHeight+40, width: 80, height: 40))
        
    }
    
    override func buttonCustomClick(_ button: UIButton) {
        let tag = button.tag
        switch tag {
        case 0:
           test0()
        case 1:
           test1()
        case 2:
            test2()
        case 3:
            test3()
        case 4:
            test4()
        default:
            break
        }
    }
    
    func test0() {
        snowView?.removeFromSuperview()
        snowView = nil
    }
    func test1() {
        
        snowView = JJSnowRainView(frame: CGRect(x: 0, y: kNavBarHeight*2, width: KScreenWidth, height: KScreenHeight-kNavBarHeight*2))
        snowView?.layer.masksToBounds = true
        view.addSubview(snowView!)
          
         
    }
    func test2() {
        redPackertView = JJRedPackertRainView(frame: CGRect(x: 0, y: kNavBarHeight*2, width: KScreenWidth, height: KScreenHeight-kNavBarHeight*2))
        view.addSubview(redPackertView!)
        redPackertView?.startRedPackerts()
    }
    func test3() {
        
    }
    func test4() {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

