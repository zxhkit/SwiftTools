//
//  JJTabBarController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/5/24.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()


        addChildVC(childController: JJHomeViewController(), tiltle: "首页", normalImage: "kl_tabbar_icon_home_normal", selectImage: "kl_tabbar_icon_home_selected")
        addChildVC(childController: JJMineViewController(), tiltle: "俱乐部", normalImage: "kl_tabbar_icon_group_normal", selectImage: "kl_tabbar_icon_group_selected")
        addChildVC(childController: JJMineViewController(), tiltle: "首页", normalImage: "kl_tabbar_icon_msg_normal", selectImage: "kl_tabbar_icon_msg_selected")




    }
    

    func addChildVC(childController : UIViewController, tiltle:String, normalImage:String, selectImage:String) {
        let navi = JJNavigationController(rootViewController: childController)
        childController.title = title
        navi.tabBarItem.title = title;
        navi.tabBarItem.image = UIImage(named: normalImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navi.tabBarItem.selectedImage = UIImage(named: selectImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navi.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: UIControl.State.normal)
        navi.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: UIControl.State.selected)
        addChild(navi)
    }
    
}
