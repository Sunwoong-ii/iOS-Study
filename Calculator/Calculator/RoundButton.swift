//
//  RoundButton.swift
//  Calculator
//
//  Created by 김선웅 on 2021/09/25.
//

import UIKit

// 변경된 값을 스토리보드에서 실시간으로 볼 수 있게 해줌
@IBDesignable
class RoundButton: UIButton {
    
    // 스토리 보드에서 값을 설정할 수 있게 해줌.
   @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
                
            }
        }
    }
}
