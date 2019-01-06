//
//  CalculatorViewController.swift
//  Auto Layout Calculator
//  Copyright © 2019 Greg Hughes. All rights reserved.
//
import UIKit

class CalculatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var numberlabel: UILabel!
    
    
    var operation = true
    
    
    
    
    var op = ""
    
    var number1 : Double? = nil
    var number2 : Double? = nil
    lazy var textnum = String(numberlabel.text!)
    
    //appending number to label
    
    func Addnumberfunc(number:String)
    {
        
        var textnum = String(numberlabel.text!)

        
        if operation {

            textnum = ""
            operation = false
        }
        
        
        textnum = textnum + number
        
        
        
        
        numberlabel.text = textnum
        
        if number1 != nil {
            number2 = Double(textnum)
        }
        
        
        
        
    }
    
    
    //clear button action
    @IBAction func acaction(_ sender: Any) {
        
//        number1 = 0
//        number2 = 0
        number1 = nil
        number2 = nil
        numberlabel.text = ""
        
        operation = true
        
        
        
    }
    
    
    //number making negitive
    @IBAction func some(_ sender: Any) {
        
        
        var textnum = String(numberlabel.text!)
        
        textnum = "-" + textnum
        
        numberlabel.text = textnum
        
        if number2 == nil{
            number1 = Double(textnum)
        } else{
            number2 = Double(textnum)
        }
        operation = true
        
        
        
    }
    
    
    //percent button
    @IBAction func percentage(_ sender: Any) {
        
        
        var number1 = Double(numberlabel.text!)
        
        if number1 != nil {
        number1 = number1!/100.0
        
        numberlabel.text = String(number1!)
        
        operation = true
        }
        
     }
    
    @IBAction func divide(_ sender: Any) {
        
        operation = true
        divide(numberOne: number1, numberTwo: number2)
        op = "/"
    }
    
    
    @IBAction func mul(_ sender: Any) {
        
        operation = true
        multiply(numberOne: number1, numberTwo: number2)
        op = "*"
    }
    
    
    @IBAction func minus(_ sender: Any) {
        
        operation = true
        subtract(numberOne: number1, numberTwo: number2)
        op = "-"
    }
    
    @IBAction func plus(_ sender: Any) {
        
        operation = true
        add(numberOne: number1, numberTwo: number2)
        op = "+"
        
    }
    
    @IBAction func seven(_ sender: Any) {
        
        Addnumberfunc(number: "7")
        
     }
    
    @IBAction func eight(_ sender: Any) {
        
        
        Addnumberfunc(number: "8")
        
        
    }
    
    
    @IBAction func nine(_ sender: Any) {
        
        Addnumberfunc(number: "9")
        
    }
    
    @IBAction func four(_ sender: Any) {
        Addnumberfunc(number: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        
        Addnumberfunc(number: "5")
        
        
    }
    
    @IBAction func six(_ sender: Any) {
        
        Addnumberfunc(number: "6")
        
        
    }
    @IBAction func one(_ sender: Any) {
        
        Addnumberfunc(number: "1")
        
    }
    
    @IBAction func two(_ sender: Any) {
        
        
        Addnumberfunc(number: "2")
        
    }
    @IBAction func three(_ sender: Any) {
        
        Addnumberfunc(number: "3")
        
        
    }
    
    
    @IBAction func zero(_ sender: Any) {
          Addnumberfunc(number: "0")
    }
    
    
    
    
    
    
    
    @IBAction func dot(_ sender: Any) {
        
        Addnumberfunc(number: ".")
        
    }
    
    @IBAction func eqauls(_ sender: Any) {
        
        
        
        
        var result:Double?
        
        guard let numberOneUnwrapped = number1, let numberTwoUnwrapped = number2 else { return }
        
        switch op {
        case "*":
            result = numberOneUnwrapped * numberTwoUnwrapped
        case "/":
            result = numberOneUnwrapped / numberTwoUnwrapped
            
        case "-":
            result = numberOneUnwrapped - numberTwoUnwrapped
  
        case "+":
            result = numberOneUnwrapped + numberTwoUnwrapped
            
        default:
            result = 0.0
            
        }
        
        
        numberlabel.text = String(result!)
        result = Double(numberlabel.text!)
        
        number1 = result
        number2 = nil
        operation = true
        
        
        
    }
}
extension CalculatorViewController {
    
     func multiply(numberOne: Double?, numberTwo: Double?){
        
        
        if number2 != nil && number2 != nil {
            equals()
        }
        
        if number1 == nil{
            
            number1 = Double(numberlabel.text!)
            number2 = nil
            
        }
            
        else if number1 != nil && number2 != nil{
            
            number2 = Double(numberlabel.text!)
            
            let result = number1! * number2!
            
            numberlabel.text = "\(result)"
        }
        
        number1 = Double(numberlabel.text!)
        number2 = nil
    }
    
    
    func divide(numberOne: Double?, numberTwo: Double?){
        if number2 != nil && number2 != nil {
            equals()
        }
        if number1 == nil{
            
            number1 = Double(numberlabel.text!)
            number2 = nil
            
        }
            
        else if number1 != nil && number2 != nil{
            
            number2 = Double(numberlabel.text!)
            
            let result = number1! / number2!
            
            numberlabel.text = "\(result)"
        }
        
        number1 = Double(numberlabel.text!)
        number2 = nil
    }
    
    
    func add(numberOne: Double?, numberTwo: Double?){
        
        if number2 != nil && number2 != nil {
            equals()
        }
        
        
        if number1 == nil{
            
            number1 = Double(numberlabel.text!)
            number2 = nil
            
        }
            
        else if number1 != nil && number2 != nil{
            
            number2 = Double(numberlabel.text!)
            
            let result = number1! + number2!
            
            numberlabel.text = "\(result)"
        }
        
        number1 = Double(numberlabel.text!)
        number2 = nil
    }
    
    
    func subtract(numberOne: Double?, numberTwo: Double?){
        if number2 != nil && number2 != nil {
            equals()
        }
        
        
        if number1 == nil{
            
            number1 = Double(numberlabel.text!)
            number2 = nil
            
        }
            
        else if number1 != nil && number2 != nil{
            
            number2 = Double(numberlabel.text!)
            
            let result = number1! - number2!
            
            numberlabel.text = "\(result)"
        }
        
        number1 = Double(numberlabel.text!)
        number2 = nil
    }
    
    
   
    func equals (){
        var result:Double?
        
        guard let numberOneUnwrapped = number1, let numberTwoUnwrapped = number2 else { return }
        
        switch op {
        case "*":
            result = numberOneUnwrapped * numberTwoUnwrapped
        case "/":
            result = numberOneUnwrapped / numberTwoUnwrapped
            
        case "-":
            result = numberOneUnwrapped - numberTwoUnwrapped
            
        case "+":
            result = numberOneUnwrapped + numberTwoUnwrapped
            
        default:
            result = 0.0
            
        }
        
        
        numberlabel.text = String(result!)
        result = Double(numberlabel.text!)
        
        number1 = result
        number2 = nil
        operation = true
    }
}
