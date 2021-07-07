//
//  JJJsonViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/7.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
import ObjectMapper

class JJJsonViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupNavigationViewTitle("json处理")
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: (KScreenWidth - 60)/2, y: kNavBarHeight+40, width: 60, height: 40)
        btn.backgroundColor  = UIColor.lightGray
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 3
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitle("点击一下", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(btn)
        
                
    }
    
    
    @objc private func buttonClick() {
        test1()
        test2()
        test3()
        test4()
        test5()
    }
    

    func test1() {
        
        //转成JSON对象
        let student:[[String: Any]] = [
                                      ["name":"张三","sex":"男","age":19,"address":"上海","score":96],
                                      ["name":"李红","sex":"女","age":11,"address":"郑州","score":87],
                                      ["name":"王二","sex":"男","age":40,"address":"江苏","score":67]
                                ]
        
        let jsonData = JSON.init(student)//或者 jsonData = JSON(student)
        let name = jsonData[0]["name"].stringValue
        
        JJToast.showMessage(name)
        
        
        let age1 = jsonData[0]["age"].stringValue
        let age2 = jsonData[1]["age"].intValue
        
        print("age1=== \(age1), age2=== \(age2)")
        
    }
    
    func test2() {
        
    }
   
    func test3() {
        
    }
    func test4() {
        
    }
    func test5() {
        
    }
    
}
