//
//  FoodViewModel.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class FoodViewModel {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // pridanie zjedeneho jedla
    func addMeal(weight: Int64, foodId: NSManagedObjectID, completion: @escaping (() -> Void)) {
        let meal = Meal(context: self.managedObjectContext)
        meal.date = Date()
        meal.weight = weight
        let food = self.managedObjectContext.object(with: foodId) as! Food
        meal.food = food
        
        do {
            try self.managedObjectContext.save()
            completion()
        } catch {
            completion()
        }
    }
    
    // vytvorenie noveho jedla
    func addNewFood(name: String, carbs: Double, proteins: Double, fats: Double, completion: @escaping (() -> Void)) {
        let food = Food(context: self.managedObjectContext)
        food.name = name
        food.carbs = carbs
        food.proteins = proteins
        food.fats = fats
        
        do {
            try self.managedObjectContext.save()
            completion()
        } catch {
            completion()
        }
    }
}
