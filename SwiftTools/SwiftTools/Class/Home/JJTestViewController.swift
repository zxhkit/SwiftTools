//
//  JJTestViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/5.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJTestViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewTitle("测试")
        // Do any additional setup after loading the view.
        
        
        
        let structCoder = StructCoder(name: "XH", age: 25)
        
        var structCoder2 = StructCoder()
        structCoder2.name = "XH"
        structCoder2.age = 25
        
    }
    

    

}



// 定义类
class 类名 {
  //定义类的成员
}
// 建立一个 class 名称为 ClassCoder
class ClassCoder {
 var name = "IAMXH"
 var age = 0
}

// 定义结构体
struct 结构体名 {
  //定义结构体的成员
}
// 建立一个 struct 名称为 StructCoder
struct StructCoder {
 var name = "IAMXH"
 var age = 0

}




extension ClassCoder {
    func modifyCoderName(newName:String) {
        
        self.name = newName
    }
}



extension StructCoder{
    mutating func modifyCoderName(newName:String) {
        self.name = newName
    }
}
