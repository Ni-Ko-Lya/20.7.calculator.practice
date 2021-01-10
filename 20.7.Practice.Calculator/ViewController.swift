//
//  ViewController.swift
//  20.7.Practice.Calculator
//
//  Created by Николай Павленко on 28.12.2020.
//

import UIKit

var isArgumentDouble: Bool = false
var argumentX: String = ""
var argumentY: String = ""
var isFirstPress: Bool = true
var operationType: String = ""
var isNegative: Bool = false


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
        
        //проверяем вводится ли число заново или продолжается набор - если это первое нажатие на клавишу, то текст в дисплее заменяется на значение числовой кнопки, иначе значение цифровой кнопки добавляется в конец текста дисплея.
        if isFirstPress {
            if isNegative {
                display.text = "-\(String(number))"
                isFirstPress = false
            }
            else
            {
                display.text = "\(String(number))"
                isFirstPress = false
                }
            }
        else
        {
        //проверяем является ли отображаемое на дисплее число нулём
        if display.text == "0"
            {
            display.text = "\(String(number))"
            }
            else
            {
                if  display.text!.count < 10 // - задаём максимальное число символов на экране
                {
                display.text = "\(display.text!)\(String(number))"
                }
            }
            }
            isFirstPress = false
        }
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        
        //проверяем вводится ли число заново или продолжается набор - если это первое нажатие на клавишу, то отображаемый на дисплее текст заменяется на "0.", в противном случае запятая добавляется в конец отображаемого текста
        if isFirstPress {
            
            //проверяем является ли вводимое число отрицательным
            if isNegative {
                display.text = "-0."
                isFirstPress = false
            }
            else
            {
            display.text = "0."
            isFirstPress = false
            }
        }
        else
        {
        //проверяем присутствует ли уже в отображаемом числе запятая - если да, то нажатие не срабатывает
        var numberDoesNotContainDot: Bool = true
        for char in display.text! {
            if char == "." {
                numberDoesNotContainDot = false
            }
        }
        if numberDoesNotContainDot {
            if  display.text!.count < 10 // - задаём максимальное количество символов на экране 10
            {
                display.text = "\(display.text ?? "0")."
            }
        }
        }
        //print (display.text?.count as Any)
        isArgumentDouble = true
        isFirstPress = false
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "+" {
            argumentX = display.text!
            operationType = "add"
            isFirstPress = true
            //display.text = "0"
        }
        
        if sender.titleLabel?.text == "−" {
            if isFirstPress {
                display.text = "-"
                isFirstPress = false
                }
            else
            {
                argumentX = display.text!
                operationType = "substract"
                isFirstPress = true
            }
        }
        
        if sender.titleLabel?.text == "×" {
            argumentX = display.text!
            operationType = "multiply"
            isFirstPress = true
        }
        
        if sender.titleLabel?.text == "÷" {
            //  *** code for DIVISION ***
            argumentX = display.text!
            operationType = "divide"
            isFirstPress = true
        }
        
        if sender.titleLabel?.text == "%" {
            //процент принято вычислять сразу, без нажатия на кнопку "равно", поэтому вычисление реализуем здесь
            let x: Double = Double(display.text!)!
            let result: Double = x / 100
            display.text = String(result)
            isFirstPress = true
        }
        
        
         if sender.titleLabel?.text == "+/-" {
            //  *** code for +/- ***
            if isFirstPress {
                display.text = "-"
                isNegative = true
                }
            else {
                let string = display.text!
                let char = string[string.startIndex]
                if char == "-" {
                    display.text = String(string.dropFirst(1))
                    isNegative = false
                }
                else {
                display.text = "-\(display.text!)"
                isNegative = true
                }
            }
            isFirstPress = false
        }
        
        isArgumentDouble = false
        isNegative = false
    }

    
    @IBAction func ACButtonPressed(_ sender: UIButton) {
        display.text = "0"
        argumentX = display.text!
        argumentY = display.text!
        isFirstPress = true
        isNegative = false
    }
    
    @IBAction func ResultButtonPressed(_ sender: UIButton) {

        argumentY = display.text!
        
        //проверяем является ли один из аргументов Double
        for char in argumentX {
            if char == "." {isArgumentDouble = true}
        }
        for char in argumentY {
            if char == "." {isArgumentDouble = true}
        }
        
        switch operationType {
        case "add":
            if isArgumentDouble {
                let x: Double = Double(argumentX)!
                let y: Double = Double(argumentY)!
                let result: Double = x + y
                display.text = String(result)
            } else {
                let x: Int = Int(argumentX)!
                let y: Int = Int(argumentY)!
                let result: Int = x + y
                display.text = String(result)
            }
        case "multiply":
            if isArgumentDouble {
                let x: Double = Double(argumentX)!
                let y: Double = Double(argumentY)!
                let result: Double = x * y
                display.text = String(result)
            } else {
                let x: Int = Int(argumentX)!
                let y: Int = Int(argumentY)!
                let result: Int = x * y
                display.text = String(result)
            }
        case "substract":
            if isArgumentDouble {
                let x: Double = Double(argumentX)!
                let y: Double = Double(argumentY)!
                let result: Double = x - y
                display.text = String(result)
            } else {
                let x: Int = Int(argumentX)!
                let y: Int = Int(argumentY)!
                let result: Int = x - y
                display.text = String(result)
            }
        case "divide": //поскольку результат деления чаще всего получается дробный, то для деления оставим реализацию только с типом Double
            
                let x: Double = Double(argumentX)!
                let y: Double = Double(argumentY)!
                if y == 0.0 {display.text = "error"}
                else {
                    let result: Double = x / y
                    display.text = String(result)
                }
        default:
            return
        }
        argumentX = display.text!
        isFirstPress = true
        isArgumentDouble = false
        isNegative = false
    }
}

