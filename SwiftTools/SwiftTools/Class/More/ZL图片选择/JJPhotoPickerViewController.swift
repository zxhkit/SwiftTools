//
//  JJPhotoPickerViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import ZLPhotoBrowser

class JJPhotoPickerViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewTitle("ZL图片选择")

        _ = createCustomButton("选择图片1", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("选择图片2", 2, CGRect(x: 120, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("选择图片3", 3, CGRect(x: 210, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("选择图片4", 4, CGRect(x: 300, y: kNavBarHeight+40, width: 80, height: 40))

        // Do any additional setup after loading the view.
    }

    override func buttonCustomClick(_ button: UIButton) {
        let tag = button.tag
        switch tag {
        case 1:
           test1()
        case 2:
            test2()
        case 3:
            test3()
        case 4:
            test4()
        default:
            break
        }
    }
    
    func test1() {
        let ps = ZLPhotoPreviewSheet()
        ps.selectImageBlock = { [weak self] (images, assets, isOriginal) in
            // your code
        }
        ps.showPreview(animate: true, sender: self)
    }
    func test2() {
        let ps = ZLPhotoPreviewSheet()
        ps.selectImageBlock = { [weak self] (images, assets, isOriginal) in
            // your code
        }
        ps.showPhotoLibrary(sender: self)
    }
    func test3() {
        
    }
    func test4() {
        
    }
    
}
