//
//  HeaderPositionViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class HeaderPositionViewController: PagerBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pagingView.pinSectionHeaderVerticalOffset = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

}
