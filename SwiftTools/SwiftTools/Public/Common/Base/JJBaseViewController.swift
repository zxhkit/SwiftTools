//
//  JJBaseViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/28.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJBaseViewController: UIViewController {

    
    lazy var navigationCustomView: JJBaseNavigationView = {
        let nav = JJBaseNavigationView()
        
        return nav
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        view.addSubview(navigationCustomView)
        navigationCustomView.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view);
            make.height.equalTo(kNavBarHeight);
        }
        
        navigationCustomView.isHidden = true
        navigationCustomView.backBtnActionClosure = { [weak self] in
            if let strongSelf = self {
                strongSelf.backButtonAction()
                strongSelf.navigationController?.popViewController(animated: true)
            }
        }
        
        
    }
    
    
    
    public func backButtonAction() {
        
    }
    
    public func setupNavigationViewTitle(_ title:String) {
        self.navigationCustomView.title = title
        navigationCustomView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func createCustomButton(_ text: String, _ tag: Int, _ frame: CGRect) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.frame = frame
        btn.tag = tag
        btn.backgroundColor  = UIColor.lightGray
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 3
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(buttonCustomClick(_:)), for: .touchUpInside)

        view.addSubview(btn)
        return btn
    }
    
    
    @objc func buttonCustomClick(_ button: UIButton) {
        
    }
    

}
