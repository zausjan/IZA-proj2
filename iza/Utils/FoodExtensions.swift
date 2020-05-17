//
//  FoodExtensions.swift
//  iza
//
//  Created by Jan Zauska on 17/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import Foundation

// vypocet kalorii
extension Food {
    func getCalories() -> Double {
        return 4 * proteins + 5 * carbs + 9 * fats
    }
}
