//
//  JsonModel.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/8.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation
import SwiftyJSON
import HandyJSON
import ObjectMapper

//创建模型，使用Class也可以，但是如果不需要继承或者不是很复杂，推荐使用结构体struct 
struct StudentModel {
    var name: String?
    var sex: String?
    var age: Int?
    var address: String;
    var score: Int?
    var scores: Scores?
    var loves: [Love]?

    init(_ jsonData: JSON) {
        name = jsonData["name"].stringValue
        sex = jsonData["sex"].stringValue
        age = jsonData["age"].intValue
        address = jsonData["address"].stringValue
        score = jsonData["score"].intValue
        scores = Scores(jsonData["scores"])
        loves = Love.getList(jsonData["loves"])
                
    }
    
    
    
}


struct Scores {
    var chinese: Int?
    var math: Int?
    var english: Int?

    init(_ jsonData: JSON) {
        chinese = jsonData["chinese"].intValue
        math = jsonData["math"].intValue
        english = jsonData["english"].intValue
    }
    
}

struct Love {
    var num: Int?
    var sport: String?

    init(_ jsonData: JSON) {
        num = jsonData["num"].intValue
        sport = jsonData["sport"].stringValue
    }
    
    static func getList(_ jsonData: JSON) -> [Love] {
        
        var arr = [Love]()
        
        
        for i in  0..<jsonData.count {
            let model = Love(jsonData[i])
            arr.append(model)
        }
        return arr
    }
    
}






struct Player: Mappable {
    
    var name: String?
    var countrry: String?
    var age: Int?
    var weight: Double?
    var targets: Target?

    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name        <-   map["name"]
        countrry    <-    map["countrry"]
        age         <-    map["age"]
        weight      <-    map["weight"]
        targets      <- map["targets"]
    }
    
}


struct Target: Mappable {
    
    var fat: Double?
    var waisthip: Double?

    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        fat        <-   map["fat"]
        waisthip    <-    map["waisthip"]

    }

}












struct UserModel: HandyJSON {
    var id: String?
    var name: String?
    var phoneNum: String?
    var familyMemberrs: [String]?
    var family: Family?

}

struct Family: HandyJSON {
    var mother: String?
    var father: String?
    var brother: String?
    var sister: String?
}



class Person: HandyJSON {
    var id: String?
    var name: String?
    var phoneNum: String?
    var family: Family?
    required init() {}

}

class Student: Person {
    var weight: Double?
    required init() {}
}

