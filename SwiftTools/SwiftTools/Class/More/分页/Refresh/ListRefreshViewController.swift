//
//  ListRefreshViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import JXPagingView
import JXSegmentedView


class ListRefreshViewController: PagerBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.isNeedHeader = true
    }
    override func preferredPagingView() -> JXPagingView {
        return JXPagingListRefreshView(delegate: self)
    }

    //用于测试每次点击segment切换，都触发子列表的下拉刷新
/*
    override func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        super.segmentedView(segmentedView, didSelectedItemAt: index)

        guard let list = pagingView.validListDict[index] as? ListViewController else {
            return
        }
        list.tableView.mj_header?.beginRefreshing()
    }
 */

}
