//
//  ViewController.swift
//  SwiftTestingSample
//
//  Created by Juan Mueller on 12/2/22.
//  For more, visit www.ajourneyforwisdom.com
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public var numberArray: [NSDecimalNumber] = []
    public var operation: String?
    
    public var currentNumber: NSDecimalNumber? = nil
    public var lengthAfterPoint = -1
    
    @IBOutlet weak var display: UILabel!
    
    func refreshDisplay() {
        var formula = ""
        
        for i in 0..<numberArray.count {
            formula += numberArray[i].stringValue
            
            if i == 0 {
                formula += operation ?? ""
            }
        }
        
        if let currentNumber = currentNumber {
            var currentNumStr = currentNumber.stringValue
            
            if lengthAfterPoint >= 0 {
                var countAfterPoint = 0
                
                if !currentNumStr.contains(".") {
                    currentNumStr += "."
                } else {
                    countAfterPoint = currentNumStr.split(separator:".")[1].count
                }
                
                for _ in (countAfterPoint ..< lengthAfterPoint) {
                    print(lengthAfterPoint)
                    
                    currentNumStr += "0"
                }
            }
            
            formula += currentNumStr
        }
        
        display.text = formula
    }
    
    @IBAction func onNumberTap(_ sender: UIButton) {
        let tappedNum = NSDecimalNumber(value: Int((sender.titleLabel?.text)!)!)
        
        if currentNumber == nil {
            currentNumber = 0
        }
        
        if lengthAfterPoint < 0 {
            currentNumber = currentNumber!.multiplying(by: 10)
            
            if currentNumber!.doubleValue >= 0 {
                currentNumber = currentNumber!.adding(tappedNum)
            } else {
                currentNumber = currentNumber!.subtracting(tappedNum)
            }
        } else {
            var currentPosition = NSDecimalNumber(0.1)
            
            for _ in 0..<lengthAfterPoint {
                currentPosition = currentPosition.multiplying(by: NSDecimalNumber(0.1))
            }
            
            currentNumber = currentNumber?.adding(tappedNum.multiplying(by: currentPosition))
            lengthAfterPoint += 1
        }
        
        refreshDisplay()
    }

    @IBAction func onACTap(_ sender: Any?) {
        currentNumber = nil
        
        accountForFraction()
        
        numberArray = []
        operation = nil
        
        display.text = "0"
    }
    
    @IBAction func onCTap(_ sender: Any) {
        currentNumber = nil
        
        accountForFraction()
        refreshDisplay()
        
        if numberArray.count <= 0 {
            display.text = "0"
        }
    }
    
    @IBAction func onDotTap(_ sender: Any) {
        if currentNumber == nil {
            currentNumber = 0
        }
        
        if lengthAfterPoint < 0 {
            lengthAfterPoint = 0
            
            refreshDisplay()
        }
    }
    
    @IBAction func onPercentTap(_ sender: Any) {
        guard let current = currentNumber else { return }
        
        currentNumber = current.dividing(by: 100)
        
        accountForFraction()
        
        refreshDisplay()
    }
    
    @IBAction func onSignTap(_ sender: Any) {
        guard let current = currentNumber else { return }
        
        currentNumber = NSDecimalNumber(0).subtracting(current)
        
        refreshDisplay()
    }
    
    @IBAction func onOperationTap(_ sender: UIButton) {
        if ["+", "-", "*", "/"].contains(where: { display.text!.contains($0) }) {
            calculateResult()
        }
        
        numberArray.append(currentNumber ?? 0)
        operation = sender.titleLabel?.text
        
        currentNumber = nil
        
        accountForFraction()
        
        lengthAfterPoint = -1
        
        refreshDisplay()
    }
    
    @IBAction func onEqualTap(_ sender: Any) {
        calculateResult()
    }
    
    func calculateResult() {
        numberArray.append(currentNumber ?? 0)
        
        switch operation {
        case "+":
            currentNumber = numberArray[0].adding(numberArray[1])
            
            break
        case "-":
            currentNumber = numberArray[0].subtracting(numberArray[1])
            
            break
        case "*":
            currentNumber = numberArray[0].multiplying(by: numberArray[1])
            
            break
        case "/":
            if numberArray[1] == 0 {
                onACTap(nil)
                
                display.text = "You can't divide by Zero"
                
                return
            }
            
            currentNumber = numberArray[0].dividing(by: numberArray[1])
            
            break
        default: break
            // NOTHING
        }
        
        accountForFraction()
        
        numberArray = []
        operation = nil
        
        refreshDisplay()
    }

    func accountForFraction() {
        lengthAfterPoint = -1
        
        if currentNumber != nil {
            let currentNumStr = (currentNumber ?? NSDecimalNumber(0)).stringValue
            
            if currentNumStr.contains(".") {
                lengthAfterPoint = currentNumStr.split(separator:".")[1].count
            }
        }
    }
}
