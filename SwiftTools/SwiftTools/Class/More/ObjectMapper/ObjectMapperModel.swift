//
//  ObjectMapperModel.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/9.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation
import ObjectMapper


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



