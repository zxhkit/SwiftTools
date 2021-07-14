//
//  JJCycleViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJCycleViewController: JJBaseViewController {

    
    private lazy var cycleView: JJCycleView = {
        let cc = JJCycleView(frame: CGRect(x: 0, y: kNavBarHeight+100, width: KScreenWidth, height: 200))
        //设置
        return cc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationViewTitle("轮播图")

        // Do any additional setup after loading the view.
        _ = createCustomButton("改变数据有值", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 100, height: 40))
        _ = createCustomButton("改变数据空值", 2, CGRect(x: 150, y: kNavBarHeight+40, width: 100, height: 40))

        
        cycleView.data = ["小学","初中","高中","大学"]
        cycleView.isAutoPage = true
        view.addSubview(cycleView)
        
    }
    
    override func buttonCustomClick(_ button: UIButton) {
        let tag = button.tag
        switch tag {
        case 1:
            cycleView.data = ["一楼","二楼","三楼","四楼","五楼"]
        case 2:
            cycleView.data = []
        default:
            break
        }
    }
    

}
