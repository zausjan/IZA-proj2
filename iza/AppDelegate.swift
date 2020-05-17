//
//  AppDelegate.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if !appAlreadyLaunchedOnce() {
            addInitialData()
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "iza")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func appAlreadyLaunchedOnce() -> Bool{
        let defaults = UserDefaults.standard
        
        if defaults.string(forKey: "alreadyLaunched") != nil {
            return true
        } else {
            defaults.set(true, forKey: "alreadyLaunched")
            return false
        }
    }
    
    // pridanie dat aby aplikacia nevyzerala uplne prazdne
    private func addInitialData() {
        let banana = Food(context: persistentContainer.viewContext)
        banana.name = "Banana"
        banana.carbs = 23
        banana.proteins = 1.1
        banana.fats = 0.3
        
        let steak = Food(context: persistentContainer.viewContext)
        steak.name = "Steak"
        steak.carbs = 0
        steak.proteins = 25
        steak.fats = 19
        
        let meal = Meal(context: persistentContainer.viewContext)
        meal.date = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        meal.weight = 300
        meal.food = banana
        
        let meal2 = Meal(context: persistentContainer.viewContext)
        meal2.date = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
        meal2.weight = 500
        meal2.food = steak
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Error: \(error)")
        }
    }
}

