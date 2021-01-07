//
//  ViewController.swift
//  20.7.Practice.Calculator
//
//  Created by Николай Павленко on 28.12.2020.
//

import UIKit

class ViewController: UIViewController {
 
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        guard let numberString = sender.titleLabel?.text else {return}
        let number = Int(numberString)!
        print (number)
        
        //проверяем является ли отображаемое число нулём
        if display.text != "0"
        {
            if  display.text!.count < 10 // - задаём максимальное число символов на экране
            {
            display.text = "\(display.text ?? "0")\(String(number))"
                
                print ("display count is \(display.text!.count)")
            }
        }
        
        else
            {
            display.text = "\(String(number))"
            
            print ("display count is \(display.text!.count)")
            }
        }
    
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        //проверяем присутствует ли уже в отображаемом числе запятая
        var doesNotContainDot: Bool = true
        for char in display.text! {
            if char == "." {
                doesNotContainDot = false
            }
        }
        if doesNotContainDot {
            if  display.text!.count < 10 // - задаём максимальное число символов на экране
            {
            display.text = "\(display.text ?? "0")."
            }
        }
        print (display.text?.count as Any)
    }
    
    
    
    @IBAction func operationButtonPressed(_ sender: Any) {
    }
    
    @IBAction func ACButtonPressed(_ sender: UIButton) {
        display.text = "0"
    }
    
    
    
}

