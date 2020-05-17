//
//  HistoryViewModel.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

final class HistoryViewModel {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // historia zjedenych jedal pre kazdy datum
    var mealHistory: [(date: Date, nutrition: NutritionModel)] = []
    
    // odfiltrovanie dnesneho dna kedze je osobite v headeri
    var mealHistoryWithoutToday: [(date: Date, nutrition: NutritionModel)] {
        get {
            return mealHistory.filter {
                !Calendar.current.isDateInToday($0.date)
            }
        }
    }
    
    // data pre hedaer
    var todayNutrition: NutritionModel {
        get {
            return mealHistory.first { Calendar.current.isDateInToday($0.date) }?.nutrition ?? NutritionModel(proteins: 0, carbs: 0, fats: 0)
        }
    }
    
    init() {
        // pocuvanie na zmeny DB kvoli updatom
        NotificationCenter.default.addObserver(self, selector: #selector(contextWillSave(_:)), name: Notification.Name.NSManagedObjectContextWillSave, object: nil)
        getMealHistory()
    }
    
    @objc
    func contextWillSave(_ notification: Notification) {
        getMealHistory()
    }
    
    // funkcie pre zgroupovanie jedal podla datumu
    
    private func groupMealsByDay(meals: [Meal]) -> [Date: [Meal]]{
        let initial: [Date: [Meal]] = [:]
        let groupedByDay = meals.reduce(into: initial) { acc, cur in
            let components = Calendar.current.dateComponents([.year, .month, .day], from: cur.date!)
            let date = Calendar.current.date(from: components)!
            let existing = acc[date] ?? []
            acc[date] = existing + [cur]
        }
        
        return groupedByDay
    }
    
    private func fetchMeals() -> [Meal] {
        let fetchRequest = NSFetchRequest<Meal>(entityName: "Meal")
        let sort = NSSortDescriptor(key: #keyPath(Meal.date), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            let meals = try managedObjectContext.fetch(fetchRequest)
            return meals
        } catch {
            print("Failed to fetch meals: \(error)")
            return []
        }
    }
    
    private func getMealHistory() {
        let meals = fetchMeals()
        let groupedMeals = groupMealsByDay(meals: meals)
        
        // zratanie nutrientov
        let nutritionModels = groupedMeals.map { date, mealsOfDay -> (Date, NutritionModel) in
            var proteins: Double = 0
            var carbs: Double = 0
            var fats: Double = 0
            
            for meal in mealsOfDay {
                let mealProteins: Double = (meal.food?.proteins ?? 0) / 100 * Double(meal.weight )
                let mealCarbs: Double = (meal.food?.carbs ?? 0) / 100 * Double(meal.weight)
                let mealFats: Double = (meal.food?.fats ?? 0) / 100 * Double(meal.weight)

                proteins += mealProteins
                carbs += mealCarbs
                fats += mealFats
            }
            return (date, NutritionModel(proteins: proteins, carbs: carbs, fats: fats))
        }
        
        mealHistory = nutritionModels
    }
}
