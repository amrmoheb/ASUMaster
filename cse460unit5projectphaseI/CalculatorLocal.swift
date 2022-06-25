//
//  CalculatorLocal.swift
//  cse460unit5projectphaseI
//
//  Created by Mohamed Elzohirey on 22/06/2022.
//  Copyright © 2022 nanqiao chen. All rights reserved.
//

import Foundation
class CalculatorLocal : CalculatorProtocol{
    
    
    var gender: Gender = Gender.male
    
    var height: Double = 0.0
    
    var weight: Double = 0.0
    
    
    func setInputs(height: Double, weight: Double , gender : Gender) {
        self.height = height
        self.weight = weight
        self.gender = gender
    }
    
    func calcBMI() -> Double {
        let BMI_value = (weight/(height*height))*703
        return BMI_value
    }
    
    func labelValue() -> String {
        let BMI_value = (weight/(height*height))*703
        let c:String = String(format: "%.2f", BMI_value)
        if(BMI_value < 18){
            return c
        }
        else if(BMI_value >= 18 && BMI_value < 25){
            return c
        }
        else if(BMI_value >= 25 && BMI_value < 30){
            return c
        }
        else{
            return c
        }
    }
    
    func messageValue() -> String {
        let BMI_value = (weight/(height*height))*703
        if(BMI_value < 18){
            return "You are underweight"
        }
        else if(BMI_value >= 18 && BMI_value < 25){
            return "You are normal"
        }
        else if(BMI_value >= 25 && BMI_value < 30){
            return "You are pre-obese"
        }
        else{
            return "You are obese"
        }
    }
    

    
}
