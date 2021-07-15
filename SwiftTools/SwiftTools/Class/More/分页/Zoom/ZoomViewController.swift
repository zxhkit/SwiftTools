//
//  ZoomViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import JXPagingView
import JXSegmentedView


class ZoomViewController: PagerBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func pagingView(_ pagingView: JXPagingView, mainTableViewDidScroll scrollView: UIScrollView) {
        userHeaderView.scrollViewDidScroll(contentOffsetY: scrollView.contentOffset.y)
    }

}
