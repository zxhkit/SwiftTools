//
//  JJHomeViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/5/24.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func convert(_ s: String, _ numRows: Int) -> String {

        if numRows <= 1 {
            return s
        }
    
        if s.count <= numRows {
            return s
        }
        
        var strs:[String] = []
        
        for _ in 0 ..< numRows {
            strs.append("")
        }
        
        var row = 0
        var isAsc = true
        
        for character in s {
            strs[row].append(character)
            if isAsc {
                row += 1
            } else {
                row -= 1
            }
            if row == numRows - 1 || row == 0{
                isAsc = !isAsc
            }
        }
        return strs.joined()
    }
    
    func reverse(_ x: Int) -> Int {
        var num = x
        
        var rev = 0
        while num != 0 {
            let pop = num % 10
            num /= 10
            // 正数溢出检查
            if rev > 214748364 || (rev == 214748364 && pop > 7) {
                return 0
            }
            // 负数溢出检查
            if rev < -214748364 || (rev == -214748364 && pop < -8) {
                return 0
            }
            rev = rev * 10 + pop
        }
        return rev
    }

}
