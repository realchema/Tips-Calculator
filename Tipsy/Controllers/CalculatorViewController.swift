//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    var stepperValue: String = ""
    var result: Float = 0.0
    
    var billAmountFloat: Float = 0.0
    var numberOfPeople: Float = 0.0
    var tipPorcentage: Float = 0.0
    
    var pressedButton: String!

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap(gesture:)))
               self.view.addGestureRecognizer(tapGesture)

    }
    
    @objc func tap(gesture: UITapGestureRecognizer) {
        billTextField.resignFirstResponder()
    }
    
   
    
    
    @IBAction func tipChanged(_ sender: Any) {
        
        
       
        
        pressedButton = (sender as AnyObject).currentTitle!
        
        
        switch pressedButton {
        case "0%":
            zeroPctButton.isSelected = true
            
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            print(((pressedButton! as NSString).floatValue)/(100))
        case "10%":
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
           print(((pressedButton! as NSString).floatValue)/(100))
        case "20%":
            twentyPctButton.isSelected = true
            
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            
            print(((pressedButton! as NSString).floatValue)/(100))
        default:
           break
        }
        
       
       
        
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.maximumValue = 12
        stepperValue =  String(format: "%.0f", sender.value)
        
        splitNumberLabel.text = stepperValue
        //print(stepperValue)
    }
    
    @IBAction func calculatedPressed(_ sender: Any) {
        
        
               billAmountFloat = ((billTextField.text! as NSString).floatValue)
               numberOfPeople = ((splitNumberLabel.text! as NSString).floatValue)
               tipPorcentage = ((pressedButton! as NSString).floatValue)/(100)
        
        
        result = billAmountFloat * (1+tipPorcentage) / numberOfPeople
           
           print("\(result) Result ")
//           print("\(billAmountFloat)bill amount " )
//           print("\(numberOfPeople)number of people")
//           print("\(tipPorcentage)tip porcentage")
        
        
        
        
        //print(billTextField.text ?? billTextField.text!)
        //print(stepperValue)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.totalAmount = String(format: "%.2f", result)
                destinationVC.splitNBR = String(format: "%.0f",numberOfPeople)
                tipPorcentage = tipPorcentage * 100
                destinationVC.percentageNBR = String(format: "%.0f", tipPorcentage)
                  
              }
    }
    
    
}

