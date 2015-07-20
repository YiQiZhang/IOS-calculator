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
}

