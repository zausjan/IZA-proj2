//
//  NutritionModel.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import Foundation

struct NutritionModel {
    let proteins: Double
    let carbs: Double
    let fats: Double
    
    var calories: Double {
        get {
            return 9 * fats + 5 * carbs + 4 * proteins
        }
    }
}
