//
//  ResponseModel.swift
//  cse460unit5projectphaseI
//
//  Created by Mohamed Elzohirey on 25/06/2022.
//  Copyright © 2022 nanqiao chen. All rights reserved.
//

import Foundation

struct Response: Codable{
    let bmi: Double
    let healthInfo: Array<String>
    let risk: String
}

