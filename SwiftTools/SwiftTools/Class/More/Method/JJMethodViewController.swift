//
//  JJMethodViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJMethodViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        self.setupNavigationViewTitle("基本方法验证")

        
        _ = createCustomButton("按钮1", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 60, height: 40))
        _ = createCustomButton("按钮2", 2, CGRect(x: 120, y: kNavBarHeight+40, width: 60, height: 40))
        _ = createCustomButton("按钮3", 3, CGRect(x: 210, y: kNavBarHeight+40, width: 60, height: 40))
        _ = createCustomButton("按钮4", 4, CGRect(x: 300, y: kNavBarHeight+40, width: 60, height: 40))
       
        _ = createCustomButton("按钮5", 5, CGRect(x: 30, y: kNavBarHeight+100, width: 60, height: 40))
        _ = createCustomButton("按钮6", 6, CGRect(x: 120, y: kNavBarHeight+100, width: 60, height: 40))
        _ = createCustomButton("按钮7", 7, CGRect(x: 210, y: kNavBarHeight+100, width: 60, height: 40))
        _ = createCustomButton("按钮8", 8, CGRect(x: 300, y: kNavBarHeight+100, width: 60, height: 40))

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
        case 5:
            test5()
        case 6:
            test6()
        case 7:
            test7()
        case 8:
            test8()
        default:
            break
        }
        
    }
    
    //map函数和flatMap函数
    func test1() {
        let numbers = [1,2,3,4,5,6]
        let result = numbers.map { num in
            return num + 2
        }
        print(result)
        
        let nums = (1...8).map { (v) -> String in
            return  "str" + String(v)
        }
        print(nums)
        
        let data = numbers.map {$0 + 3}
        
        print(data)
        
       /* map 方法接受一个闭包作为参数， 然后它会遍历整个 numbers 数组，并对数组中每一个元素执行闭包中定义的操作。 相当于对数组中的所有元素做了一个映射。 比如咱们这个例子里面的闭包是讲所有元素都加 2 。 这样它产生的结果数据就是 [3,4,5,6]。
         */
       
        
        
        let numsData1 = numbers.compactMap {$0 + 2}
        print(numsData1)
        let numbersCompound = [[1,2,3],[4,5,6]];
        let res1 = numbersCompound.map{$0.map{$0+2}}
        let res2 = numbersCompound.compactMap{$0.map{$0+2}}
        let res3 = numbersCompound.flatMap{$0.map{$0+2}}

        print(res1)
        print(res2)
        print(res3)
    }
    func test2() {
        
    }
    func test3() {
        
    }
    func test4() {
        
    }
    func test5() {
        
    }
    func test6() {
        
    }
    func test7() {
        
    }
    func test8() {
        
    }
    
    
    
    
    
    
    
    
    
    
    

}
