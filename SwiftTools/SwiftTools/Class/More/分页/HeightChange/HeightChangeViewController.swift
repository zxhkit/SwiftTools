//
//  HeightChangeViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class HeightChangeViewController: PagerBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "高度", style: .plain, target: self, action: #selector(didNaviRightItemClicked))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func didNaviRightItemClicked() {
        if tableHeaderViewHeight == 200 {
            //先更新`func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int`方法用到的变量
            tableHeaderViewHeight = 100
            //再调用resizeTableHeaderViewHeight方法
            pagingView.resizeTableHeaderViewHeight()
        }else {
            tableHeaderViewHeight = 200
            pagingView.resizeTableHeaderViewHeight()
        }
    }
    

}
