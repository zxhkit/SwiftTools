//
//  JJTestViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/5.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import CocoaLumberjack

class JJTestViewController: JJBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewTitle("测试")
        // Do any additional setup after loading the view.
        
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
        default:
            break
        }
        
    }
    
    private func test1() {
        let _ = StructCoder(name: "XH", age: 25)
        
        var structCoder2 = StructCoder()
        structCoder2.name = "XH"
        structCoder2.age = 25
        
        var s1:[String] = ["2"]
        var s2:[String] = []
        
        
        s2 = s1
        
        s1.append("3")
        
        s2.append("0")
        
        print(s1)
        print(s2)
    }
    private func test2() {
        
        let path1 = JJFileManager.homePath()
        let path2 = JJFileManager.documentPath()
        let path3 = JJFileManager.cachePath()
        let path4 = JJFileManager.libraryPath()

        let log = JJFileManager.logsPath()
        let logs = JJFileManager.getLogFiles()

        
        print(path1)
        print(path2!)
        print(path3)
        print(path4)
        print(log)
        print(logs)

    }
    private func test3() {
                DDLogVerbose("Verbose")
                DDLogDebug("Debug")
                DDLogInfo("Info")
                DDLogWarn("Warn")
                DDLogError("Error")
    }
    private func test4() {
        
    }
    private func test5() {
        
    }
    
    
    
}


class A {
    fileprivate func study()  {
        print("爱学习")
    }
}

class B:A {
    func show() {
        study()
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
