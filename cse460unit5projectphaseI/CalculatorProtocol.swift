//
//  CalculatorProtocol.swift
//  cse460unit5projectphaseI
//
//  Created by Mohamed Elzohirey on 22/06/2022.
//  Copyright © 2022 nanqiao chen. All rights reserved.
//

import Foundation
protocol CalculatorProtocol{
    var height: Double { get set }
    var weight: Double { get set }
    
    func setInputs(height: Double, weight: Double) 
    func calcBMI() -> Double
    func labelValue() -> String
    func messageValue() -> String
}
