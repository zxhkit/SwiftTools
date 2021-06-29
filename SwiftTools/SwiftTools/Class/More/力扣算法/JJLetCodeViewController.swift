//
//  JJLetCodeViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/6/28.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJLetCodeViewController: JJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationCustomView.isHidden = false
        self.setupNavigationViewTitle("算法")
        // Do any additional setup after loading the view.
        
        let ss = "wew"
        
        let aa = Array(ss)
        
        let aaa = ss.components(separatedBy: "e")
        
        let sss = aaa.joined()
        
        
        let b = isValid("()[]{}{}")
        
        let num = strStr("qwertyuiop", "iop")
        
        print(sss,aa,b,num)
        

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
    
    
    
    func dem222o(_ nums: [Int]) -> Int {
        
        return 0
    }
    
    func demo(_ nums: Array<Int>) -> Int {
        
        //return test(nums,0)
        
        var arr:[Int] = nums
        
        var num = 0
        while arr.count > 1 {
            var list:[Int] = []
            for item in arr {
                if num == 5 {
                    num = 0
                }else{
                    list.append(item)
                    num += 1
                }
            }
            arr = list
        }
        
        
        if arr.count == 1 {
            return arr[0]
        }
        
        return arr.first ?? 0
        
    }
    
    func test(_ arr: [Int], _ i : Int) -> Int {
        
        if arr.count == 1 {
            return arr[0]
        }
        
        var list:[Int] = []
        var num = i
        
        for item in arr {
            if num == 5 {
                num = 0
            }else{
                list.append(item)
                num += 1
            }
        }
        return test(list, num)
    }
    
    
    
    
    //28. 实现strStr()
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let count1 = haystack.count
        let count2 = needle.count
        if count2 == 0 {
            return 0
        }
        
        if count1 < count2 {
            return -1
        }
        
        let haystackChars = haystack.cString(using: .utf8)!
        let needleChars = needle.cString(using: .utf8)!
        var i = 0
        var j = 0
        
        let maxi = count1 - count2
        while i <= maxi && j < count2 {
            var m = i
            while m < count1 && j < count2 {
                if haystackChars[m] == needleChars[j] {
                    m += 1
                    j += 1
                    continue
                }
                j = 0
                i += 1
                break
            }
        }
        if j == count2{
            return i
        }
        return -1
    }
    
    func strStr1(_ haystack: String, _ needle: String) -> Int {
        let count1 = haystack.count
        let count2 = needle.count
        if count2 == 0 {
            return 0
        }
        
        if count1 < count2 {
            return -1
        }
        
        let haystackChars = haystack.cString(using: .utf8)!
        let needleChars = needle.cString(using: .utf8)!
        
        for i in 0..<haystack.count {
            if i + needle.count <= haystack.count {
                let strs = haystackChars[i..<(i+needle.count)]
                var isSame = true
                var j = 0
                for s in strs {
                    if s != needleChars[j] {
                        isSame = false
                        break
                    }
                    j += 1
                }
                if isSame {
                    return i
                }
            }else{
                return -1
            }
        }
        return -1
    }
    
    
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if s.isEmpty || words.isEmpty {
            return []
        }
        let wordLength = words[0].count
        var resultARR = [Int]()
        
        
        
        return resultARR
    }
    
    //31. 下一个排列(Swift版)
    func nextPermutation(_ nums: inout [Int]) {
        var j = nums.count
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i+1] > nums[i] {
                for k in stride(from: nums.count-1, to: i, by: -1) {
                    j = k
                    if nums[k] > nums[i] {
                        break
                    }
                }
                nums.swapAt(i, j)

                return
            }
        }
        return nums.sort()
        
       /* 其实就是从数组倒着查找，找到nums[i] 比nums[i+1]小的时候，
          就将nums[i]跟nums[i+1]到nums[nums.length - 1]当中找到一个最小的比nums[i]大的元素交换。
         交换后，再把nums[i+1]到nums[nums.length-1]排序，就ok了
       */
        
//        var j = nums.count
//        for i in stride(from: nums.count-2, through: 0, by: -1) {
//            if nums[i+1] > nums[i] {
//                for k in stride(from: nums.count-1, to: i, by: -1) {
//                    j = k
//                    if nums[k] > nums[i] {
//                        break
//                    }
//                }
//                nums.swapAt(i, j)
//                nums[i+1..<nums.count].sort()
//                return
//            }
//        }
//        nums.sort()
    }
}
