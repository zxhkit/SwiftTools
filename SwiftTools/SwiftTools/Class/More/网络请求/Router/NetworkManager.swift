//
//  NetworkManager.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/29.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON
import UIKit



///超时时长
private var requestTimeOut:Double = 30
// 单个模型的成功回调 包括： 模型，网络请求的模型(code,message,data等，具体根据业务来定)
//typealias RequestModelSuccessCallback<T:Mappable> = ((T,ResponseModel?) -> Void)











/// endpointClosure
private let myEndpointClosure = { (target : API) -> Endpoint in
    ///这里的endpointClosure和网上其他实现有些不太一样。
    ///主要是为了解决URL带有？无法请求正确的链接地址的bug
    let url = target.baseURL.absoluteString + target.path
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: {
            .networkResponse(200, target.sampleData)
        },
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers)
    switch target {
    case .testApi:
        return endpoint
    case .register:
        requestTimeOut = 5//按照项目需求针对单个API设置不同的超时时长
        return endpoint
    default:
        requestTimeOut = 30
        return endpoint
    }
}


private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        request.timeoutInterval = requestTimeOut
        //打印请求参数
        if let requestData = request.httpBody {
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")"+"发送参数"+"\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
        
    } catch  {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}



/*   设置ssl
 let policies: [String: ServerTrustPolicy] = [
 "example.com": .pinPublicKeys(
 publicKeys: ServerTrustPolicy.publicKeysInBundle(),
 validateCertificateChain: true,
 validateHost: true
 )
 ]
 */
// 用Moya默认的Manager还是Alamofire的Manager看实际需求。HTTPS就要手动实现Manager了
//private public func defaultAlamofireManager() -> Manager {
//
//    let configuration = URLSessionConfiguration.default
//
//    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//
//    let policies: [String: ServerTrustPolicy] = [
//        "ap.grtstar.cn": .disableEvaluation
//    ]
//    let manager = Alamofire.SessionManager(configuration: configuration,serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
//
//    manager.startRequestsImmediately = false
//
//    return manager
//}

/// NetworkActivityPlugin插件用来监听网络请求
private let networkPlugin = NetworkActivityPlugin.init { changeType, TargetType in
    print("networkPlugin \(changeType)")
    
    //TargetType 是当前请求的基本信息
    switch (changeType){
    case .began :
        print("开始请求网络")
    case .ended :
        print("网络请求结束")
    }
}

//stubClosure   用来延时发送网络请求

let xProvider  = MoyaProvider<API>(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)



///先添加一个闭包用于成功时后台返回数据的回调
typealias successCallback = ((String) -> (Void))
typealias failureCallback = ((String) -> (Void))

///再次用一个方法封装provider.request()
func NetWorkRequest(_ target: API, completion: @escaping successCallback,failure:@escaping failureCallback){
    //先判断网络是否有链接 没有的话直接返回--代码略
    
    xProvider.request(target) { (result) in
        switch result {
        case let .success(response):
            do {
                //这里转JSON用的swiftyJSON框架
                let jsonData = try JSON(data: response.data)
                //判断后台返回的code码没问题就把数据闭包返回 ，我们后台是0000 以实际后台约定为准。
                if jsonData["RESULT_CODE"].stringValue == "0000" {
                    completion(String(data: response.data, encoding: String.Encoding.utf8)!)
                }else{
                    print("flag不为0000 HUD显示后台返回message"+"\(jsonData["RESULT_MESSAGE"].stringValue)")
                }
            } catch {
                
            }
        case let .failure(error):
            print(error)
            failure("error-msg")
        }
    }
    
}






























