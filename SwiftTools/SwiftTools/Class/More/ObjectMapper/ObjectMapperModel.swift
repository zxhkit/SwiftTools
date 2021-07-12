//
//  ObjectMapperModel.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/9.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation
import ObjectMapper


//1.模型定义
class User: Mappable {
    var username: String?
    var age: Int?
    var weight: Double!
    var bestFriend: User?        // User对象
    var friends: [User]?         // Users数组
    var birthday: Date?
    var array: [AnyObject]?
    var dictionary: [String : AnyObject] = [:]
     
    init(){
    }
     
    required init?(map: Map) {
        
        
        //ObjectMapper 通过 Mappable 协议中的 init?(map: Map) 方法来初始化创建对象。
        //我们可以利用这个方法，在对象序列化之前验证 JSON 合法性。在不符合的条件时，返回 nil 阻止映射发生。
        
        //检查JSON中是否含有"username"属性
        if map.JSON["username"] == nil {
            return nil
        }
    }
     
    // Mappable
    func mapping(map: Map) {
        username    <- map["username"]
        age         <- map["age"]
        weight      <- map["weight"]
        bestFriend  <- map["best_friend"]
        friends     <- map["friends"]
        birthday    <- (map["birthday"], DateTransform())
        array       <- map["arr"]
        dictionary  <- map["dict"]
    }
    
}





//交通工具
class Vehicle: StaticMappable {
    //类型
    var type:String?
    
    
    static func objectForMapping(map: Map) -> BaseMappable? {
        if let type:String = map["type"].value() {
            switch type {
            case "car":
                return Car()
            case "bus":
                return Bus()
            default:
                return Vehicle()
            }
        }
        return nil
    }
    
    init() {
    }
    
    func mapping(map: Map) {
        type   <-  map["type"]
    }
    
    
}


class Car: Vehicle {
    
    //名字
    var name:String?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        name  <- map["name"]
    }
    
}


class Bus: Vehicle {
        //费用
    var fee: Int?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        fee  <-  map["fee"]
    }
    
}



























