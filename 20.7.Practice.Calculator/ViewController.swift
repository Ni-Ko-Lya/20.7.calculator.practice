//
//  ViewController.swift
//  20.7.Practice.Calculator
//
//  Created by Николай Павленко on 28.12.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayCalc: UILabel!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonDot: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonPlusMinusSign: UIButton!
    @IBOutlet weak var buttonPercent: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var argumentX: Int = 0
    var digitsCount: Int = 0
    
    @IBAction func press0(_ sender: Any) {
        argumentX = argumentX * (10^digitsCount) + 0
        digitsCount += 1
        displayCalc.text = "\(argumentX)"
        
    }
    
    @IBAction func press1(_ sender: Any) {
/*        argumentX = argumentX * (10^digitsCount) + 1
        digitsCount += 1
        displayCalc.text = "\(argumentX)"
         */
        let
        
        argumentX = Int(displayCalc.text) * 10 + 1
        displayCalc.text = "\(argumentX)"
    }

        
        
    
}

