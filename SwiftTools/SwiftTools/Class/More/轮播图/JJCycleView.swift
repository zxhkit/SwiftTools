//
//  JJCycleView.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJCycleView: UIView {

    private let ScrollInterval = 3.0

    var isAutoPage:Bool = false {
        didSet {
            let fireDate = isAutoPage ? Date(timeIntervalSinceNow: ScrollInterval) : Date.distantFuture
            timer?.fireDate = fireDate
        }
    }
    
    var titles: [String] = []
    
    var data:[String]? {
        didSet {
            titles.removeAll()
            if let list = data {
                if list.count > 0 {
                    titles += list
                    titles.append(list.first!)
                    titles.insert(list.last!, at: 0)
                }
            }
            collectionView.contentOffset = CGPoint(x: collectionView.bounds.size.width, y: 0)
            pageControl?.numberOfPages = data?.count ?? 0
            pageControl?.currentPage = 0
            collectionView.reloadData()
        }
    }
        
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        coll.delegate = self
        coll.dataSource = self
        coll.isPagingEnabled = true
        coll.backgroundColor = .clear
        coll.register(JJCycleCell.classForCoder(), forCellWithReuseIdentifier: "JJCycleCell")
        coll.showsHorizontalScrollIndicator = false
        //设置
        return coll
    }()
    
    private var pageControl: UIPageControl?
    private var timer: Timer?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        
        addSubview(collectionView)
        
        
        let controlHeight = 35
 
        pageControl = UIPageControl(frame: CGRect(x: 0, y: Int(self.bounds.size.height) - controlHeight, width: Int(self.bounds.size.width), height: controlHeight))
        pageControl?.pageIndicatorTintColor = .lightGray
        pageControl?.currentPageIndicatorTintColor = .black
        addSubview(pageControl!)
        
        timer = Timer.scheduledTimer(timeInterval: ScrollInterval, target: self, selector: #selector(timerShowNext), userInfo: nil, repeats: true)
        timer?.fireDate = Date.distantFuture

    }
    
    
    
    @objc private func timerShowNext() {
         
        if collectionView.isDragging {
            return
        }
        let targetX = collectionView.contentOffset.x + collectionView.bounds.size.width
        collectionView.setContentOffset(CGPoint(x: targetX, y: 0), animated: true)
        
    }
    
    //手动拖拽结束
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        cycleScroll()
        //拖拽操作后3s继续轮播
        if isAutoPage {
            timer?.fireDate = Date(timeIntervalSinceNow: ScrollInterval)
        }
    }
    
    //自动轮播结束
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        cycleScroll()
    }
    
    //循环显示
    func cycleScroll() {
        let page = Int(collectionView.contentOffset.x / collectionView.bounds.size.width)
        let count = titles.count
        
        if page == 0 { //最左边
            collectionView.contentOffset = CGPoint(x: collectionView.bounds.size.width * CGFloat((count - 2)), y: 0)
            pageControl?.currentPage = count - 2
        }else if page == count - 1 { //最右边
            collectionView.contentOffset = CGPoint(x: collectionView.bounds.size.width, y: 0)
            pageControl?.currentPage = 0
        }else{
            pageControl?.currentPage = page - 1
        }
        
    }

}



extension JJCycleView : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JJCycleCell", for: indexPath) as! JJCycleCell
        cell.title = titles[indexPath.row]
        return cell
    }
    
    
}
