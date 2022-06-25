//
//  subfirstViewController.swift
//  cse460unit5projectphaseI
//
//  Created by nanqiao chen on 6/22/20.
//  Copyright © 2020 nanqiao chen. All rights reserved.
//

import UIKit
import Foundation

class subfirstViewController: UIViewController {

    
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    
    @IBOutlet weak var BMI: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var message1: UITextView!
    var calculator : CalculatorProtocol!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func Calculate_BMI(_ sender: Any) {
        let heght1 = Double(height.text!)!
        let weight1 = Double(weight.text!)!
        
        let calmodel = Calculator(height: heght1, weight: weight1)
        
        calculator.setInputs(height: Double(height.text ?? "") ?? 0, weight: Double(weight.text ?? "") ?? 0)
        
        let BMI_value = calculator.calcBMI() //calmodel.BMI()
        
        
        BMI.text = "BMI:"
            
        //String(format: "%.2f", BMI_value)
        
        
        if(BMI_value < 18){
            inputLabel.textColor = .blue
            message1.textColor = .blue
        }
        else if(BMI_value >= 18 && BMI_value < 25){
            inputLabel.textColor = .green
            message1.textColor = .green
        }
        else if(BMI_value >= 25 && BMI_value < 30){
            inputLabel.textColor = .purple
            message1.textColor = .purple
        }
        else{
            inputLabel.textColor = .red
            message1.textColor = .red
        }
        
        
        inputLabel.text = calculator.labelValue()
        
        message1.text = calculator.messageValue()
        
    }
    
    

}
