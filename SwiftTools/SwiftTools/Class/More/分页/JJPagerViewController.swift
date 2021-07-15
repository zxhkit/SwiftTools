//
//  JJPagerViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJPagerViewController: JJBaseViewController {

    private lazy var tableView: JJTableView = {
        let tab = JJTableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tab.delegate = self
        tab.dataSource = self
        tab.backgroundColor = .white
        tab.keyboardDismissMode = .onDrag
        tab.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        return tab
    }()
    
    private var data:[String] = ["JJ头部缩放","头部缩放","主页下拉刷新/列表上拉加载更多","列表下拉刷新","导航栏隐藏","CollectionView列表示例","列表是VC示例","CategoryView嵌套PagingVIew","HeaderView高度改变示例","HeaderView高度改变示例(动画)","悬浮Header位置调整","滚动延续","列表缓存功能"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewTitle("分页Pager")
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-kTabBarHeight);
            make.top.equalTo(self.view).offset(kNavBarHeight);
        }
        // Do any additional setup after loading the view.
    }
    

}



extension JJPagerViewController: UITableViewDelegate, UITableViewDataSource{
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
        case "JJ头部缩放":
            let vc = JJZoomViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "头部缩放":
            let vc = ZoomViewController()
            navigationController?.pushViewController(vc, animated: true)
      
        case "主页下拉刷新/列表上拉加载更多":
            let vc = RefreshViewController()
            navigationController?.pushViewController(vc, animated: true)
          
        case "列表下拉刷新":
            let vc = ListRefreshViewController()
            navigationController?.pushViewController(vc, animated: true)
          
        case "导航栏隐藏":
            let vc = NaviHiddenViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        case "CollectionView列表示例":
            let vc = CollectionViewViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        case "列表是VC示例":
            let vc = VCViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "CategoryView嵌套PagingVIew":
            let vc = NestViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "HeaderView高度改变示例":
            let vc = HeightChangeViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "HeaderView高度改变示例(动画)":
            let vc = HeightChangeAnimationViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "悬浮Header位置调整":
            let vc = HeaderPositionViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "滚动延续":
            let vc = SmoothViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "列表缓存功能":
            let vc = ListCacheViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
        
    }
    
    
}



