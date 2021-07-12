//
//  JJObjectMapperViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/9.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit
import ObjectMapper

class JJObjectMapperViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationViewTitle("ObjectMapper")

        _ = createButton("按钮1", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 60, height: 40))
        _ = createButton("按钮2", 2, CGRect(x: 120, y: kNavBarHeight+40, width: 60, height: 40))
        _ = createButton("按钮3", 3, CGRect(x: 210, y: kNavBarHeight+40, width: 60, height: 40))
        _ = createButton("按钮4", 4, CGRect(x: 300, y: kNavBarHeight+40, width: 60, height: 40))
       
        _ = createButton("按钮5", 5, CGRect(x: 30, y: kNavBarHeight+100, width: 60, height: 40))
        _ = createButton("按钮6", 6, CGRect(x: 120, y: kNavBarHeight+100, width: 60, height: 40))
        _ = createButton("按钮7", 7, CGRect(x: 210, y: kNavBarHeight+100, width: 60, height: 40))
        _ = createButton("按钮8", 8, CGRect(x: 300, y: kNavBarHeight+100, width: 60, height: 40))

        _ = createButton("按钮9", 9, CGRect(x: 30, y: kNavBarHeight+160, width: 60, height: 40))
        _ = createButton("按钮10", 10, CGRect(x: 120, y: kNavBarHeight+160, width: 60, height: 40))
        _ = createButton("按钮11", 11, CGRect(x: 210, y: kNavBarHeight+160, width: 60, height: 40))
        _ = createButton("按钮12", 12, CGRect(x: 300, y: kNavBarHeight+160, width: 60, height: 40))

        
        
        // Do any additional setup after loading the view.
    }
    
    private func createButton(_ text: String, _ tag: Int, _ frame: CGRect) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.frame = frame
        btn.tag = tag
        btn.backgroundColor  = UIColor.lightGray
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 3
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)

        view.addSubview(btn)
        return btn
    }

    @objc private func buttonClick(_ button: UIButton)  {
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
        case 9:
            test9()
        case 10:
            test10()
        case 11:
            test11()
        case 12:
            test12()
        case 13:
            test12()
        default:
            break
        }
        
    }
    
    
    // MARK: - 模型（Model）与字典（Dictionary）相互转换
    func test1() {
        
        let lilei = User()
        lilei.username = "李雷"
        lilei.age = 19
        
        let meimei = User()
        meimei.username = "韩梅梅"
        meimei.age = 18
        
        //2.将模型转为字典
        let mmdic: [String: Any] = meimei.toJSON()
        print(mmdic)
        
        //3.将模型数组转为字典数组
        let users = [lilei,meimei]
        let userArray:[[String : Any]] = users.toJSON()
        
        print(userArray)
        
       
        
    }
    func test2() {
        let meimeiDic:[String: Any] = ["age": 17, "username": "梅梅",
                         "best_friend": ["age": 18, "username": "李雷"]]
        
        
        //4.将字典转为模型
        let meimie = User(JSON: meimeiDic)
        
        if let mm = User(JSON: meimeiDic) {
            print(mm.username ?? "-")
        }
        print(meimie?.username ?? "-")
        
        //字典数组转为模型数组
        let userArray = [["age": 17, "username": "梅梅"], ["age": 18, "username": "李雷"]]
        
        let users: [User] = Mapper<User>().mapArray(JSONArray: userArray)
        
        print(users.first?.age ?? 0)
    }
    
    
    // MARK: - 模型（Model）与JSON字符串的相互转换

    func test3() {
        let lilei = User()
        lilei.username = "李雷"
        lilei.age = 19
        
        let meimei = User()
        meimei.username = "韩梅梅"
        meimei.age = 18
        //1.将模型转为JSON字符串
        let meimieJson:String = meimei.toJSONString() ?? "-"
        
        print(meimieJson)
        
        
        //2.将模型数组转为JSON字符串
        let users = [lilei,meimei]
        let json:String = users.toJSONString()! //在开发中一般是不用强制解包的
        
        print(json)
    }

    func test4() {
        
        let meimeiJSON:String = "{\"age\":17,\"username\":\"梅梅\",\"best_friend\":{\"age\":18,\"username\":\"李雷\"}}"
        //3.将JSON字符串转为模型
        let meimei = User(JSONString: meimeiJSON)
       
        print(meimei?.username ?? "")
        
        
        let json = "[{\"age\":18,\"username\":\"李雷\"},{\"age\":17,\"username\":\"梅梅\"}]"
        //4.将JSON字符串转为模型数组
        let users:[User] = Mapper<User>().mapArray(JSONString: json)!
        
        print(users.first?.age ?? 0)
    }

    //init?(map:Map)使用介绍
    func test5() {
        
        let json = "[{\"age\":18,\"username\":\"李雷\"},{\"age\":17}]"
        let users:[User] = Mapper<User>().mapArray(JSONString: json)!
        
        print(users.count)
        
    }
    
    
    
    
    // MARK: - StaticMappable
    //前面介绍的都是ObjectMapper的Mappable协议,本文接着介绍另一个协议:StaticMappable
    /*
     1，StaticMappable协议介绍
     （1）同 Mappable 协议一样，StaticMappable 也 BaseMappable 的子协议。
     （2）ObjectMapper 通过该协议如下方法获取相应的映射对象（这个对象当然也要符合 BaseMappable 协议）。同时，我们也可以在使用这个方法在对象序列化之前验证 JSON。
     class func objectForMapping(map: Map) -> BaseMappable?
     */
    func test6() {
        
        let JSON = [["type": "car", "name": "奇瑞QQ"],
                    ["type": "bus", "fee": 2],
                    ["type": "vehicle"]]
        
        let vehicles = Mapper<Vehicle>().mapArray(JSONArray: JSON)
        
        print("交通工具数量：\(vehicles.count)")

        if let car = vehicles[0] as? Car {
            print("小汽车名字" + car.name!)
        }
        
        if let bus = vehicles[1] as? Bus {
            print("公共车费用:\(bus.fee!)元")
        }
        
    }
    
    
    
    // MARK: - 重点玩法,高级用法
    
    func test7() {
        
        
    }
    
    
    func test8() {
        
        
    }
    
    func test9() {
        
        
    }
    
    func test10() {
        
        
    }
    
    func test11() {
        
        
    }
    
    func test12() {
        
        
    }
    
    
    
    
}
