//
//  JJNetWorkViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/29.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit


class JJNetWorkViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    func request1() {
        xProvider.request(API.testApi) { result in
            switch result {
            case let .success(response):
                print(response)
            case let .failure(error):
                print(error)
                print("网络连接失败")
                break
            }
        }
        
    }
    
    func request2() {
        NetWorkRequest(API.testApi) { jsonData in
            print(jsonData)
        } failure: { errorString in
            print(errorString)
        }
    }
    
    
    
}
