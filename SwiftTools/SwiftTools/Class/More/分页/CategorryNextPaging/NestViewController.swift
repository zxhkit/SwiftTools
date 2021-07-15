//
//  NestViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import JXSegmentedView


class NestViewController: UIViewController {

    var naviDataSource = JXSegmentedTitleDataSource()
    lazy var naviSegmentedView = JXSegmentedView()
    lazy var listContainer = JXSegmentedListContainerView(dataSource: self, type: .scrollView)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let titles = ["主题一", "主题二"]
        naviDataSource.titles = titles
        naviDataSource.itemSpacing = 0
        naviDataSource.itemWidth = 80
        naviDataSource.titleNormalColor = .black
        naviDataSource.titleSelectedColor = .white
        naviDataSource.isTitleMaskEnabled = true

        naviSegmentedView.contentEdgeInsetLeft = 0
        naviSegmentedView.contentEdgeInsetRight = 0
        naviSegmentedView.frame = CGRect(x: 0, y: 0, width: 160, height: 30)
        naviSegmentedView.dataSource = naviDataSource

        let indicatoryView = JXSegmentedIndicatorBackgroundView()
        indicatoryView.indicatorColor = .red
        indicatoryView.indicatorWidth = 80
        indicatoryView.indicatorHeight = 30
        indicatoryView.indicatorWidthIncrement = 0
        indicatoryView.backgroundWidthIncrement = 0
        naviSegmentedView.indicators = [indicatoryView]

        navigationItem.titleView = naviSegmentedView

        view.addSubview(listContainer)

        naviSegmentedView.listContainer = listContainer
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        listContainer.frame = view.bounds
    }

}

extension NestViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return 2
    }

    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let pagingVC = NestSubjectViewController()
        pagingVC.nestContentScrollView = listContainer.scrollView
        pagingVC.pagingView.listContainerView.isCategoryNestPagingEnabled = true
        return pagingVC
    }
}

