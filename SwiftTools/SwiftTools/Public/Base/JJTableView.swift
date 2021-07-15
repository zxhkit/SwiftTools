//
//  JJTableView.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/28.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

@objcMembers
class JJTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configTableView() {
        self.tableHeaderView = UIView()
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
            self.estimatedRowHeight = 0
            self.estimatedSectionHeaderHeight = 0
            self.estimatedSectionFooterHeight = 0
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 13.0, *) {
            self.automaticallyAdjustsScrollIndicatorInsets = false
        }
        
        
        
        
    }

}
