//
//  ViewController.swift
//  Calculator
//
//  Created by 김선웅 on 2021/09/25.
//

import UIKit

enum Operation {
    case Plus
    case Minus
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
//        이것도 사용 가능하다.
//        print(sender.currentTitle)
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.tapOperater()
        self.currentOperation = .Divide
    }
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.tapOperater()
        self.currentOperation = .Multiply
    }
    @IBAction func tapMinusButton(_ sender: UIButton) {
        self.tapOperater()
        self.currentOperation = .Minus
    }
    @IBAction func tapPlusButton(_ sender: UIButton) {
        /*
         
         다른 방법으로는 operation 함수를 바로 호출 후에
         currentOperater 에 보낸 매개변수를 저장, firstOperand 에도 저장
        그 후 Equal 버튼에서는 unknown을 매개변수로 operation 함수를 호출
         매개변수가 unknown일 경우에는 계산을 하도록 설정한다.
         
         이렇게 하면 tapOperater를 굳이 만들지 않고 operation함수에서 적용이 가능하다.
         
         */
        self.tapOperater()
        self.currentOperation = .Plus
    }
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.secondOperand = self.displayNumber
        self.operation(currentOperation)
    }
    
    func tapOperater() {
        if !displayNumber.isEmpty {
            self.firstOperand = self.displayNumber
            self.displayNumber = ""
        }
    }
    
    func operation(_ operation: Operation){
        guard let firstOperand = Double(self.firstOperand) else { return }
        guard let secondOperand = Double(self.secondOperand) else { return }
        switch operation {
        case .Plus:
            self.result = "\(firstOperand + secondOperand)"
        case .Minus:
            self.result = "\(firstOperand - secondOperand)"
        case .Divide:
            self.result = String(firstOperand / secondOperand)
        case .Multiply:
            self.result = String(firstOperand * secondOperand)
        case .unknown:
            return
        }
        
        if let result = Double(self.result),
            result.truncatingRemainder(dividingBy: 1) == 0 {
            self.result = "\(Int(result))"
        }
        
        self.displayNumber = self.result
        self.numberOutputLabel.text = self.displayNumber
    }
}

