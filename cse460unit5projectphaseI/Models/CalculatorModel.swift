//
//  Calmodel.swift
//  cse460unit5projectphaseI
//
//  Created by nanqiao chen on 6/22/20.
//  Copyright © 2020 nanqiao chen. All rights reserved.
//

import Foundation

class CalculatorModel{
    var height: Double
    var weight: Double
    var gender : Gender
    
    init(height: Double, weight: Double , gender: Gender) {
        self.height = height
        self.weight = weight
        self.gender = gender
    }
    
}
@objc enum Gender : Int {
    case male = 0
    case female = 1
}
