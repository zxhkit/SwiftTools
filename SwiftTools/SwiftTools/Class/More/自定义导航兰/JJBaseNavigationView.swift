//
//  JJBaseNavigationView.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/29.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit


class JJBaseNavigationView: UIView {
    
    typealias BackBtnActionCallClosure = () -> Void

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        //设置
        lbl.font = UIFont.boldSystemFont(ofSize: 17)
        lbl.textColor = UIColor.black
        lbl.textAlignment = NSTextAlignment.center
        return lbl
    }()
    
    lazy var backgroundImgV: UIImageView = {
        let imgV = UIImageView()
        //设置
        return imgV
    }()
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        //设置
        btn.setImage(UIImage(named: "nav_back_black"), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        btn.addTarget(self, action: #selector(backButtonClick), for: UIControl.Event.touchUpInside)
        return btn
    }()
        
    var backBtnActionClosure:BackBtnActionCallClosure?
    
    var title: String? {
        //didSet 作用更大 能够获取新值和旧值
        //在视图绑定模型数据的时候会使用didSet
        //属性设置检查器
        didSet {
            titleLabel.text = title
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        steupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func steupUI() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
        addSubview(backgroundImgV)
        addSubview(titleLabel)
        addSubview(backBtn)
        
        backgroundImgV.snp.makeConstraints { make in
            make.edges.equalTo(self);
        }
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(17);
            make.width.height.equalTo(kNavBarContentHeight);
            make.bottom.equalTo(0);
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self);
            make.height.equalTo(kNavBarContentHeight);
            make.bottom.equalTo(0);
        }
    }
    
    @objc private func backButtonClick() {
        
        if let closure = self.backBtnActionClosure {
            closure()
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            
        } else {
            
        }
    }
    

}
