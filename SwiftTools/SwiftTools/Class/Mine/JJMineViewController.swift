//
//  JJMineViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/1.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJMineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let array = [1,2,3,4,5,6,7,8,9]
        
        
        if let idx = array.firstIndex(where: { (obj) -> Bool in
            if obj == 2{
                return true
            }
            return false
        }) {
            print("\(idx)")//7
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
