//
//  HeightChangeAnimationViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class HeightChangeAnimationViewController: PagerBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func preferredTableHeaderView() -> PagingViewTableHeaderView {
        tableHeaderViewHeight = 80
        let header = HeightChangeAnimationTableHeaderView()
        header.toggleCallback = { (isSelected) in
            self.changeTableHeaderViewHeight()
        }
        return header
    }

    
    @objc func changeTableHeaderViewHeight() {
        //改变tableHeaderViewHeight的值
        if tableHeaderViewHeight == 250 {
            //先更新`func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int`方法用到的变量
            tableHeaderViewHeight = 80
            //再调用resizeTableHeaderViewHeight方法
            pagingView.resizeTableHeaderViewHeight(animatable: true)
        }else {
            tableHeaderViewHeight = 250
            pagingView.resizeTableHeaderViewHeight(animatable: true)
        }
    }
    
    

}
