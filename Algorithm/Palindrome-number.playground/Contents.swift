import UIKit



func isPalindrome(_ x: Int) -> Bool {
    
    if x < 0 {
        return false
    } else {
        let str1 = String(x)
        let str2 = String(x)
        var reverse: String = ""
        
        for index in str1.reversed() {
            reverse.append(index)
        }
        
        if str2 == reverse {
            return true
        } else {
            return false
        }
    }
}

isPalindrome(-121)
