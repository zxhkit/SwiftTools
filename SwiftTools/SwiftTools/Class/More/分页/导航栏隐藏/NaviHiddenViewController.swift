//
//  NaviHiddenViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import JXPagingView


class NaviHiddenViewController: PagerBaseViewController {
    lazy var naviBGView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        self.automaticallyAdjustsScrollViewInsets = false

//        let kStatusBarHeight = UIApplication.shared.keyWindow!.jx_layoutInsets().top
//        let naviHeight = UIApplication.shared.keyWindow!.jx_navigationHeight()
        //导航栏隐藏就是设置pinSectionHeaderVerticalOffset属性即可，数值越大越往下沉
        pagingView.pinSectionHeaderVerticalOffset = Int(kNavBarHeight)

        //自定义导航栏
        naviBGView.alpha = 0
        naviBGView.backgroundColor = UIColor.white
        naviBGView.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: kNavBarHeight)
        self.view.addSubview(naviBGView)

        let naviTitleLabel = UILabel()
        naviTitleLabel.text = "导航栏隐藏"
        naviTitleLabel.textAlignment = .center
        naviTitleLabel.frame = CGRect(x: 0, y: kStatusBarHeight, width: KScreenWidth, height: 44)
        naviBGView.addSubview(naviTitleLabel)

        let back = UIButton(type: .system)
        back.setTitle("返回", for: .normal)
        back.frame = CGRect(x: 12, y: kStatusBarHeight, width: 44, height: 44)
        back.addTarget(self, action: #selector(naviBack), for: .touchUpInside)
        naviBGView.addSubview(back)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @objc func naviBack(){
        self.navigationController?.popViewController(animated: true)
    }

    func pagingView(_ pagingView: JXPagingView, mainTableViewDidScroll scrollView: UIScrollView) {
        let thresholdDistance: CGFloat = 100
        var percent = scrollView.contentOffset.y/thresholdDistance
        percent = max(0, min(1, percent))
        naviBGView.alpha = percent
    }

}
