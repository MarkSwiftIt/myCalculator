//
//  ViewController.swift
//  MyCalculator(11)
//
//  Created by Mark Goncharov on 10.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isNewValue = true
    var operation: MathOperation? = nil
    var previousOperation: MathOperation? = nil
    var result: Int = 0
    var newValue: Int = 0
    
    @IBOutlet weak var calculatorWork: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorWork.text = ConstantStrings.CalculatorTitle
    }
    
//MARK: - Action
    
    @IBAction func allClear(_ sender: Any) {
        
        isNewValue = true
        result = 0
        newValue = 0
        operation = nil
        previousOperation = nil
        calculatorWork.text = "0"
    }
    
    @IBAction func divisionClick(_ sender: Any) {
        
        operation = .division
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    
    @IBAction func multiplicationClick(_ sender: Any) {
        
        operation = .multiplication
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    
    
    @IBAction func minusClick(_ sender: Any) {
        
        operation = .substract
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    
    @IBAction func plusClick(_ sender: Any) {
        
        operation = .sum
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    
    @IBAction func equalsClick(_ sender: Any) {
        calculate()
    }
    
//MARK: - Action numbers
    
    @IBAction func zeroClick(_ sender: Any) {
        addDigit(digit: "0")
    }
    
    @IBAction func oneClick(_ sender: Any) {
        addDigit(digit: "1")
    }
    
    @IBAction func twoClick(_ sender: Any) {
        addDigit(digit: "2")
    }
    
    @IBAction func threeClick(_ sender: Any) {
        addDigit(digit: "3")
    }
    
    @IBAction func fourClick(_ sender: Any) {
        addDigit(digit: "4")
    }
    
    @IBAction func fiveClick(_ sender: Any) {
        addDigit(digit: "5")
    }
    
    @IBAction func sixClick(_ sender: Any) {
        addDigit(digit: "6")
    }
    
    @IBAction func sevenClick(_ sender: Any) {
        addDigit(digit: "7")
    }
    
    @IBAction func eightClick(_ sender: Any) {
        addDigit(digit: "8")
    }
    
    @IBAction func nineClick(_ sender: Any) {
        addDigit(digit: "9")
    }
    
//MARK: - Logic
    
    func calculate() {
        
        guard let operation = operation else {
            return
        }
        if previousOperation != operation {
            newValue = getInteger()
        }
        
        result = operation.makeOperation(result: result, newValue: newValue)
        previousOperation = operation
        
        calculatorWork.text = "\(result)"
        isNewValue = true
    }
    
    func addDigit(digit: String) {
        
        if isNewValue {
            calculatorWork.text = ""
            isNewValue = false
        }
        var digits = calculatorWork.text
        digits?.append(digit)
        calculatorWork.text = digits
    }
    
    func getInteger() -> Int {
        return Int(calculatorWork.text ?? "0") ?? 0
    }
    
//MARK: - Enum
    
    enum MathOperation {
        case sum, substract , multiplication, division
        
        func makeOperation(result: Int, newValue: Int) -> Int {
            switch self {
            case .sum:
                return (result + newValue)
            case .substract:
                return (result - newValue)
            case .multiplication:
                return (result * newValue)
            case .division:
                return (result / newValue)
            }
        }
    }
}


