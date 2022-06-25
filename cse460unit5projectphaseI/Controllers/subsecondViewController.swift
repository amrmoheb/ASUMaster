//
//  subsecondViewController.swift
//  cse460unit5projectphaseI
//
//  Created by nanqiao chen on 6/22/20.
//  Copyright © 2020 nanqiao chen. All rights reserved.
//

import UIKit
import SafariServices


class subsecondViewController: UIViewController {
    
    
    @IBOutlet weak var height: UITextField!
    
    
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var bmiValueLable: UILabel!
    
    @IBOutlet weak var genderLable: UITextField!
    
    @IBOutlet weak var educateMeBtn: UIButton!
    @IBOutlet weak var messageLabel: UITextView!
    var calculator : CalculatorProtocol!
    var healthInfoList =  [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        educateMeBtn.isHidden = true
    }
    
    
    

    @IBAction func Call_BMI_API(_ sender: UIButton) {
        var gender = Gender.male
        switch genderLable.text ?? "M"
        {
        case "M":
            gender = Gender.male
            break
            
        case "F":
            gender = Gender.female
            break
            
        default:
            gender = Gender.male
            break
            
        }
        calculator.setInputs(height: Double(height.text ?? "") ?? 0, weight: Double(weight.text ?? "") ?? 0, gender: gender)
        calculator.remoteCalc(compliationHandler: {
            result in
            if let result = result {
                self.healthInfoList = result.healthInfo
                self.educateMeBtn.isHidden = false

                if(result.bmi < 18){
                        self.bmiValueLable.textColor = .blue
                        self.messageLabel.textColor = .blue
                    }
                    else if(result.bmi >= 18 && result.bmi < 25){
                        self.bmiValueLable.textColor = .green
                        self.messageLabel.textColor = .green
                    }
                    else if(result.bmi >= 25 && result.bmi < 30){
                        self.bmiValueLable.textColor = .purple
                        self.messageLabel.textColor = .purple
                    }
                    else{
                        self.bmiValueLable.textColor = .red
                        self.messageLabel.textColor = .red
                    }
                
                    self.bmiValueLable.text = String(format: "%.2f", result.bmi)
                    self.bmiLabel.text = "BMI:"
                    self.messageLabel.text = result.risk
            }else{
                //TODO handle error response 
                print(" server error ")
            }
        
            
        })
      
        
    }
    
    
    @IBAction func EducateMe(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: healthInfoList[0])!)

        present(vc, animated: true)

      //  performSegue(withIdentifier: "healthInfo", sender: self)
        
    }
        /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "healthInfo") {
            // pass data to next view
            let vc :EducateMeViewController = segue.destination as! EducateMeViewController
            vc.healthInfoList = self.healthInfoList
        }
    }*/
    
    

}
