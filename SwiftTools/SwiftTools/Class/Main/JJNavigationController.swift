//
//  JJNavigationController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/5/24.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0
        super.pushViewController(viewController, animated: animated)
    }
}
