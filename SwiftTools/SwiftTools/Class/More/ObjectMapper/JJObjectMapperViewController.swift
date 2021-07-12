//
//  JJObjectMapperViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/9.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJObjectMapperViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationViewTitle("ObjectMapper")

        _ = createButton("按钮1", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 60, height: 40))
        _ = createButton("按钮2", 2, CGRect(x: 120, y: kNavBarHeight+40, width: 60, height: 40))
        createButton("按钮3", 3, CGRect(x: 120, y: kNavBarHeight+40, width: 60, height: 40))
        
        // Do any additional setup after loading the view.
    }
    
    private func createButton(_ text: String, _ tag: Int, _ frame: CGRect) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.frame = frame
        btn.tag = tag
        btn.backgroundColor  = UIColor.lightGray
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 3
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)

        view.addSubview(btn)
        return btn
    }

    @objc private func buttonClick(_ button: UIButton)  {
                
        
    }

    
    
    
    
    
    
}
