//
//  ViewController.swift
//  Calculator
//
//  Created by zhangyiqi on 7/20/15.
//  Copyright (c) 2015 zhangyiqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calDisplay: UILabel!
    var isInit: Bool = false
    
    @IBAction func appendDigt(sender: UIButton) {
        let digt = sender.currentTitle!
        
        if isInit {
            calDisplay.text = calDisplay.text! + digt
        } else {
            calDisplay.text = digt
            isInit = true
        }
        
    }
    
    var numberStack = [Double]()
    @IBAction func enter() {
        numberStack.append(displayVal)
        isInit = false
        print(numberStack)
    }
    
    // computed properties 计算型属性
    var displayVal: Double {
        get {
            return NSNumberFormatter().numberFromString(calDisplay.text!)!.doubleValue
        }
        set {
            calDisplay.text = "\(newValue)"
            isInit = false
        }
    }
    
    @IBAction func operatorAction(sender: UIButton) {
        let operatorNotice = sender.currentTitle!
        if isInit {
            enter()
        }
        switch operatorNotice{
        case "+":
            getOperaRes({ $0 + $1 })
        case "-":
            getOperaRes({ $1 - $0 })
        case "*":
            getOperaRes({ (op1, op2) -> Double in
                op1 * op2
            })
        case "/":
            getOperaRes({ $1 / $0})
        default:
            break
        }
    }
    
    func getOperaRes(operaFunc: (Double , Double) -> Double){
        if numberStack.count >= 2 {
            displayVal = operaFunc(numberStack.removeLast(), numberStack.removeLast())
            enter()
        }
    }
}

