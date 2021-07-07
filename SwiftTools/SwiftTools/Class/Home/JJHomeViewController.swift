//
//  JJHomeViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/5/24.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import SnapKit

class JJHomeViewController: JJBaseViewController {
    
    lazy var line: UIView = {
        let ln = UIView()
        //设置
        ln.backgroundColor = UIColor.gray
        return ln
    }()
    
    private lazy var tableView: JJTableView = {
        let tab = JJTableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tab.delegate = self
        tab.dataSource = self
        tab.backgroundColor = .white
        tab.keyboardDismissMode = .onDrag
        tab.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        return tab
    }()
    
    
    
    
    private var data: Array = ["测试","算法","网络请求","json处理","ewew","ew"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationCustomView.isHidden = false
        self.setupNavigationViewTitle("首页")
        self.navigationCustomView.backBtn.isHidden = true
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-kTabBarHeight);
            make.top.equalTo(self.view).offset(kNavBarHeight);
        }
        
        
        
    }
    
    
    
    
}



extension JJHomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
        guard self.data.count > indexPath.row else {
            return
        }
        
        let str = self.data[indexPath.row]
        switch str {
        case "测试":
            let vc = JJTestViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        case "算法":
            let vc = JJLetCodeViewController()
            navigationController?.pushViewController(vc, animated: true)
          
        case "网络请求":
            let vc = JJNetWorkViewController()
            navigationController?.pushViewController(vc, animated: true)
          
        case "json处理":
            let vc = JJJsonViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
    
}
