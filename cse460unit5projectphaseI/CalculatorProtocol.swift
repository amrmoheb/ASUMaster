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
    var gender: Gender { get set }
     
    func remoteCalc( compliationHandler: ( @escaping (_ response: Response?) -> Void) )
    func setInputs(height: Double, weight: Double , gender : Gender) 
    func calcBMI() -> Double
    func labelValue() -> String
    func messageValue() -> String
}
extension CalculatorProtocol {
    func remoteCalc (compliationHandler:@escaping (_ respobse: Response?) -> Void) {
          
       }
}
