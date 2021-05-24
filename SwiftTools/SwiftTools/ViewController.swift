//
//  ViewController.swift
//  SwiftTools
//
//  Created by zhouxuanhe on 2020/9/2.
//  Copyright © 2020 xuanhe. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50);
        button.backgroundColor = .red
        view.addSubview(button)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
        
        button.rx.tap.subscribe { (Void) in
             print("tap")
            self.tap()
        } onError: { (Error) in
            self.tap()
        } onCompleted: {
            self.tap()
        } onDisposed: {
            self.tap()
        }.disposed(by: DisposeBag())
        
        let scrollView = UIScrollView()
        
        scrollView.rx.contentOffset.subscribe { (contentOffset) in
            
        }.disposed(by: DisposeBag())
        
        
        
        NotificationCenter.default.rx.notification(Notification.Name.NSExtensionHostWillEnterForeground).subscribe { (notification) in
            print(notification)
        }.disposed(by: DisposeBag())
        
        
        
        Observable.of(1,2,3)
        
        
        let emtyOb = Observable<Int>.empty()
        
        emtyOb.subscribe { (number) in
            print("订阅",number)
        } onError: { (error) in
            print("error:",error)
        } onCompleted: {
            print("完成回调")
        } onDisposed: {
            print("释放回调")
        }.disposed(by: DisposeBag())

        
        
        let array = ["AAA","BBB"]
        
        
        Observable<[String]>.just(array).subscribe { (event) in
            print(event)

        }.disposed(by: DisposeBag())
        
        Observable<[String]>.just(array).subscribe { (number) in
            print("订阅:",number)
        } onError: { (error) in
            print("error:",error)
        } onCompleted: {
            print("完成回调")
        } onDisposed: {
            print("释放回调")
        }.disposed(by: DisposeBag())

    
        
        let nums = [3,2,4]
        let target = 6
        
             
        let num = twoSum(nums, target)
           
        print(num)
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        let count = nums.count
        for i in 0..<count-1 {
            for j in (i + 1)..<count {
                if nums[i] + nums[j] == target {
                    return [i , j]
                }
            }
        }
        return [0]
        
       
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var kv = [Character : Int]()
        var start = 0, end = 0, ans = 0
        
        for item in s {
            if let record = kv[item] {
                //重置开始游标位置
                start = max(record+1, start);
            }
            //记录字符在原字符串的位置
            kv[item] = end
            //记录不同字符最大长度
            ans = max(end - start + 1, ans)
            end += 1
        }
        
        return ans
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        
        // 当一个数组为空的时候特殊处理
        if (n+m)%2 == 0 {
            if m==0 {
                return Double(nums2[(m+n)/2]+nums2[(m+n)/2-1])/2
            } else if n==0{
                return Double(nums1[(m+n)/2]+nums1[(m+n)/2-1])/2
            }
            return Double(helper(nums1, nums2, (m+n)/2)+helper(nums1, nums2, (m+n)/2-1))/2
        } else {
            if m==0 {
                return Double(nums2[(m+n)/2])
            } else if n==0{
                return Double(nums1[(m+n)/2])
            }
            return Double(helper(nums1, nums2, (m+n)/2))
        }
    }
    func helper(_ nums1: [Int], _ nums2: [Int], _ x: Int) -> Int{
        var index1 = 0, index2 = 0
        var newindex1: Int
        var newindex2: Int
        var k = x
        while true {
            // 检查两个数组的越界
            if(index1>=nums1.count) {
                return nums2[index2+k]
            }
            if (index2>=nums2.count){
                return nums1[index1+k]
            }
            
            // k为0和1的特殊处理 即终止条件
            if k==0 {
                return min(nums1[index1], nums2[index2])
            }
            if k==1 {
                if nums1[index1] >= nums2[index2] {
                    index2 += 1
                } else {
                    index1 += 1
                }
                k = 0
                continue
            }
            
            // 若数组剩余未排除的数目比k/2还要小 那么取较小的值
            newindex1 = min(k/2, nums1.count-index1)
            newindex2 = min(k/2, nums2.count-index2)
            var i=0, j=0
            // 比较当前的index1位置和index2位置的值，每次循环排除一个较小数，循环的最大次数一定不超过newindex1和newindex2中的较小值
            while i<newindex1 && j<newindex2 {
                if nums1[index1]>=nums2[index2] {
                    index2 += 1
                    k -= 1
                    j += 1
                } else {
                    index1 += 1
                    k -= 1
                    i += 1
                }
            }
            
        }
    }
    
    
    
    func tap() {
        loadData { (str) in
            numa()
        }
    }
    
    func loadData(success: (String) -> ()) {
        
    }
    
    func numa()  {
        
    }
    
    
    
    
}

