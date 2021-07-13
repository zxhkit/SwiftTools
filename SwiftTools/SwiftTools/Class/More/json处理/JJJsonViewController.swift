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
    
    
    // MARK: - SwiftyJSON 👇👇👇👇👇👇👇👇
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
        
        
        let studentString =  "[{\"name\":\"张三\",\"sex\":\"男\",\"age\":19,\"address\":\"上海\",\"score\":96},{\"name\":\"李红\",\"sex\":\"女\",\"age\":11,\"address\":\"郑州\",\"score\":87},{\"name\":\"王二\",\"sex\":\"男\",\"age\":40,\"address\":\"江苏\",\"score\":67}]"
        
        let stuData = JSON(parseJSON: studentString)
        
        let student_json = JSON(student)
        let stuModel1 = StudentModel(stuData[0])
        let stuModel2 = StudentModel(student_json[0])

        
        let studentName = stuModel1.name ?? ""
        let studentAge = stuModel2.age ?? 0
        
        JJToast.showMessage(studentName + "+" + String(studentAge))
        
        
    }
    
    func test2() {
        
        //model包model
        let student:[[String: Any]] = [
            ["name":"果果","sex":"男","age":19,"address":"上海","scores":["math":149,"chinese":139,"english":149]],
            ["name":"李红","sex":"女","age":11,"address":"郑州","scores":["math":135,"chinese":125,"english":119]],
            ["name":"王二","sex":"男","age":40,"address":"江苏","scores":["math":34,"chinese":75,"english":89]]
                                ]
        
        let studentData = JSON(student)
        
        let srudentModel = StudentModel(studentData[0])
        
        let math = srudentModel.scores?.math ?? 0
        
        JJToast.showMessage(String(math))
        
    }
   
    func test3() {
        
        //model包model
        let student:[[String: Any]] = [
            ["name":"果果","sex":"男","age":19,"address":"上海","scores":["math":149,"chinese":139,"english":149],"loves":[["num":90,"sport":"篮球"],["num":95,"sport":"足球"]]],
            ["name":"李红","sex":"女","age":11,"address":"郑州","scores":["math":135,"chinese":125,"english":119],"loves":[["num":79,"sport":"乒乓球"],["num":75,"sport":"网球"]]],
            ["name":"王二","sex":"男","age":40,"address":"江苏","scores":["math":34,"chinese":75,"english":89],"loves":[["num":91,"sport":"冰球"],["num":95,"sport":"棒球"]]]
                                ]
        
        let studentData = JSON(student)
        
        let studentModel = StudentModel(studentData[0])
        
        let math = studentModel.scores?.math ?? 0

        JJToast.showMessage(String(math))

        var students = [StudentModel]()
        
        for i in 0..<studentData.count  {
             
            let m = StudentModel(studentData[i])
            students.append(m)
        }
        
        
        print(students[0].loves?.first?.sport ?? "-")
        
        
    }
    
    // MARK: - SwiftyJSON 👆👆👆👆👆👆👆👆

    
    // MARK: - ObjectMapper 👇👇👇👇👇👇👇👇
    
    func test4() {
        let playerJson: [String : Any] = ["name": "李四", "country": "中国", "age": "23", "weight": 133.0]
        let playerModel = Mapper<Player>().map(JSON: playerJson)
        
        print(playerModel?.name ?? "-")
        
        //或者
        
        let playerJsons: [[String : Any]] = [
            ["name": "李四", "country": "中国", "age": "23", "weight": 133.0,"targets":["fat":13.2,"waisthip":0.9]],
            ["name": "大周", "country": "中国", "age": "22", "weight": 140.1,"targets":["fat":12.2,"waisthip":0.86]]
        ]

        let playerList = Mapper<Player>().mapArray(JSONArray: playerJsons)
        
        
        
        let playerr = playerList[0]
        let target = playerr.targets
        let fat = target?.fat ?? 0
        
        print(String(fat))
        
        
    }
    
    // MARK: - ObjectMapper 👆👆👆👆👆👆👆👆

    
    
    // MARK: - 👇👇👇  HandyJSON 👇👇👇👇👇

    func test5() {
        
        let jsonString = "{\"id\":\"3243224\",\"name\":\"亮哥\",\"phoneNum\":\"13232324343\"}"
        if let user = JSONDeserializer<UserModel>.deserializeFrom(json: jsonString) {
            print(user.name ?? "-")
        }
        
        let json = ["id":"3243224","name":"亮哥","phoneNum":"13232324343"]
        if let user = UserModel.deserialize(from: json) {
            print(user.name ?? "-")
        }
    }
    
    func test6() {
        
        let json: [String : Any] = ["id":"3243224","name":"亮哥","phoneNum":"13232324343","familyMemberrs":["爸爸","妈妈","哥哥","妹妹"]]
        if let user = UserModel.deserialize(from: json) {
            print(user.familyMemberrs ?? [])
        }
    }
    
    func test7() {
        let json: [String : Any] = ["code":200, "msg": "success","data":["user":["id":"3243224","name":"亮哥","phoneNum":"13232324343","familyMemberrs":["爸爸","妈妈","哥哥","妹妹"],"family":["mother":"毛毛","father":"烜烜","brother":"果果","sister":"妹妹"]]]]
            
        if let user = UserModel.deserialize(from: json, designatedPath: "data.user") {
            print(user.name ?? "-")
            print(user.family?.father ?? "-")
        }
        
        
        
        let jsonTest: [String : Any] = ["code":200, "msg": "success","data":["user":["id":"3243224","name":"亮哥","phoneNum":"13232324343","familyMemberrs":["爸爸","妈妈","哥哥","妹妹"],"family":["mother":"毛毛","father":"烜烜","brother":"果果","sister":"妹妹"],"test":[["mother":"毛毛1","father":"烜烜1","brother":"果果1","sister":"妹妹1"],["mother":"毛毛2","father":"烜烜2","brother":"果果2","sister":"妹妹2"],["mother":"毛毛3","father":"烜烜3","brother":"果果3","sister":"妹妹3"]]]]]

        if let userTest = UserModel.deserialize(from: jsonTest, designatedPath: "data.user") {
            
            print(userTest.test?.first?.mother ?? "-")
        }
        
        
    }
    
    
    //继承
    func test8() {
        let json: [String : Any] = ["id":"3243224","name":"亮哥","phoneNum":"13232324343","weight":120.0]
        if let student = Student.deserialize(from: json)  {
            print(student.weight ?? 0)
        }
        
    }
    // MARK: - 👆👆👆   HandyJSON 👆👆👆👆👆

}
