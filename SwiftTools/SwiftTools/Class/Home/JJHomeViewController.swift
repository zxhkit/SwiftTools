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
        
        let ss = "wew"
        
        let aa = Array(ss)
        
        let aaa = ss.components(separatedBy: "e")
        
        let sss = aaa.joined()
        
        
       let b = isValid("()[]{}{}")
        
        
        print(sss,aa,b)

        
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
    
    //8.字符串转换整数(atoi)（Swift版）
    func myAtoi(_ s: String) -> Int {
        
        var num: Int? = nil   //最后返回的结果
        var isMinus:Bool? = nil  //是否是"-"
        
        
        for a in s {
            let str = String(a)
            
            if num == nil && isMinus == nil && (str == " " || str == "-" || str == "+") {
                if str == "-" || str == "+" {
                    isMinus = str == "-"
                }
                continue
            }
            if let i = Int(str) {
                let ii = (isMinus ?? false) ? (i * -1) : i
                if (num ?? 0) > 214748364 || (num == 214748364 && ii > 7){
                    return 2147483647
                }
                if (num ?? 0) < -214748364 || (num == -214748364 && ii < -8){
                    return -2147483648
                }
                num = (num ?? 0) * 10 + ii
            }else{
                break
            }
        }
        return num ?? 0
    }
    
    
    //9. 回文数
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0){
            return false
        }
        
        var num = x
        var numLast = 0
        //当numLast >= num 的时候,停止循环
        while num > numLast {
            numLast = numLast * 10 + num % 10
            num /= 10
        }
        return (numLast == num) || (numLast / 10 == num)
    }
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        return isMatchs2(Array(s), Array(p))
    }
    
    func isMatchs2(_ s: [Character], _ p: [Character]) -> Bool {
        if p.count == 0 {
            return s.count == 0
        }
        let m = s.count
        let n = p.count
        var dp: Array<Array<Bool>> = []
        for i in 0...m {
            if i == 0 {
                dp.append([true])
            }else{
                dp.append([false])
            }
            for j in 1...n {
                dp[i].append(false)
                if (j > 1 && p[j - 1] == "*") {
                    dp[i][j] = dp[i][j - 2] || (i > 0 && (s[i - 1] == p[j - 2] || p[j - 2] == ".") && dp[i - 1][j])
                } else {
                    dp[i][j] = i > 0 && dp[i - 1][j - 1] && (s[i - 1] == p[j - 1] || p[j - 1] == ".")
                }
            }
        }
        return dp[m][n]
    }
    
    func isMatchs1(_ ss: [Character], _ pp: [Character]) -> Bool {
        let s = ss
        let p = pp
        if p.isEmpty {
            return s.isEmpty
        }
        if p.count > 1 && p[1] == "*" {
            return isMatchs(s, Array(p[2..<p.count])) || (!s.isEmpty && (s.first == p.first || p.first == Character(".")) && isMatchs(Array(s[1..<s.count]),p))
        }else{
            return !s.isEmpty && (s.first == p.first || p.first == Character(".")) && isMatchs(Array(s[1..<s.count]), Array(p[1..<p.count]))
        }
    }
    
    
    func isMatchs(_ ss: [Character], _ pp: [Character]) -> Bool {
        var s = ss
        let p = pp
        if p.isEmpty {
            return s.isEmpty
        }
        if p.count == 1 {
            return s.count == 1 && (s.first == p.first || p.first == Character("."))
        }
        if p[1] != "*" {
            if s.isEmpty {
                return false
            }
            return (s.first == p.first || p.first == Character(".")) && isMatchs(Array(s[1..<s.count]), Array(p[1..<p.count]))
        }else{
            while !s.isEmpty && (s.first == p.first || p.first == Character(".")) {
                if isMatchs(s, Array(p[2..<p.count])) {
                    return true
                }
                s.removeFirst()
            }
            return isMatchs(s, Array(p[2..<p.count]))
        }
    }
    
    // 12.整数转罗马数字(Swift版)
    func intToRoman1(_ num: Int) -> String {
        var str = ""
        var n = num
        let nums = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
        let romans = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
        
        var i = 0
        while n > 0 {
            while n >= nums[i] {
                str += romans[i]
                n -= nums[i]
            }
            i += 1
        }
        return str
    }
    
    
    
    //13. 罗马数字转整数(Swift版)
    func romanToInt(_ s: String) -> Int {
        var str = s
        var num = 0
        
        let nums = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
        let romans = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
        var i = 0
        while str.count > 0 {
            let roman = romans[i]
            // 此处虽然有一个while循环，但是romans是固定的，不随n的变化而变化，所以时间复杂度依然是O(n)
            while str.hasPrefix(roman) {
                str.remove(at: str.startIndex)
                if roman.count == 2 {
                    str.remove(at: str.startIndex)
                }
                num += nums[i]
            }
            i += 1
        }
        return num
    }
    
    
    //15. 三数之和(Swift版)
    
    /*
     func threeSum(_ nums: [Int]) -> [[Int]] {

     }
     现将nums排序,然后遍历排序后的数组arr,将赋值当前元素为fist,旁边的元素为second(位置为left),
     最后一个元素为third(位置为right),然后移动left和right(必须保证left<right).
     
     如果(sum = first+second+third) sum > 0 则right向左移动 right -= 1
     如果sum<0 ,则left向右移动,left+=1
     sum=0,则将结果[first,second,third]添加到result中,同时如果第left和第left+1元素相等,则跳过这个元素
     如果right元素和第right-1的元素相等,也跳过这个元素.避免出现重复的三元组
     */
    //16. 最接近的三数之和(Swift版)

    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {

        var result:Int? = nil
        if nums.count < 3 {
            return 0
        }
        let arr = nums.sorted()
        for i in 0..<arr.count-2 {
            let first = arr[i]
            if i > 0 && arr[i] == arr[i-1] {
                continue
            }
            var left = i+1
            var right = arr.count-1
            while left < right {
                let sum = first + arr[left] + arr[right]
                if result == nil || abs(sum-target) <= abs(result! - target) {
                    result = sum
                }
                if sum == target {
                    return result!
                }else if sum < target {
                    left += 1
                }else{
                    right -= 1
                }
            }
        }
        return result ?? 0
    }
    //20. 有效的括号(Swift版)
    func isValid(_ s: String) -> Bool {
        if s.count == 0 {
            return true
        }
        var arr: [Character] = []
        for a in s {
            if a == ")" {
                if arr.popLast() != "(" {
                    return false
                }
            }else if a == "]" {
                if arr.popLast() != "[" {
                    return false
                }
            }else if a == "}" {
                if arr.popLast() != "{" {
                    return false
                }
            }else{
                arr.append(a)
            }
        }
        return arr.count == 0
    }
    
    
    
}
