//
//  API.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/29.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation
import Moya


enum API {
    case testApi  //无参数接口
    case updateApi(parameters:[String:Any])
    case register(email:String,password:String)
    case uploadHeadImage(parameters:[String:Any],imageData:Data)
    
}

extension API:TargetType{
    //baseURL 也可用枚举区分不同的baseURL,不过一般只需要一个baseURL
    var baseURL: URL {
        return URL.init(string: Moya_baseURL)!
    }
    
    //不同接口的子路径
    var path: String {
        switch self {
        case .testApi:
            return "1111"
        case .updateApi:
            return "ewewew"
        case .register(let email, _):
            return email + "/ewewew/wewew"
        case .uploadHeadImage:
            return "eweqweqweq"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .testApi:
            return .get
        case .register:
            return .post
        default:
            return .post
        }
    }
    
    /// 这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .testApi:
            return .requestPlain
            
        case let .updateApi(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case let .register(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: URLEncoding.default)
            
        case .uploadHeadImage(let parameters, let imageData):
            let formData = MultipartFormData(provider: .data(imageData), name: "file", fileName: "zhou.png", mimeType: "image/png")
            return .uploadCompositeMultipart([formData], urlParameters: parameters)
        }
    }
    
    //同task，具体选择看后台 有application/x-www-form-urlencoded 、application/json
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    
}






