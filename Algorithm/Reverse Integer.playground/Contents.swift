import UIKit

func reverse(_ x: Int) -> Int {
    
    if Int32.min < x, x < Int32.max-1 {
    
        var num = x
        var value: String = ""
        var check: Bool = false
        var resultNum: Int = 0
        
        if x >= 0 {
            //        음수 양수 체크
            check = true
        } else {
            //      음수일때 양수로 변환
            num = -num
        }
        let str: String = String(num)
        
        for index in str.reversed() {
            value.append(index)
        }
        
        if let result = Int(value) {
            
            if !check{
                resultNum = -result
            } else {
                resultNum = result
            }
        }
        if Int32.min > resultNum || resultNum > Int32.max-1 {
            return 0
        }
        return resultNum
    } else {
        return 0
    }
}

reverse(1534236469)
1534236469
9646324351
2147483647
