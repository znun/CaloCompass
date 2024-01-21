//
//  DataController.swift
//  CaloCompass
//
//  Created by Mahmudul Hasan on 21/1/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
        
    }
    
    func save(context: NSManagedObjectContext) {
        do{
            try context.save()
            print("Data save successfully")
        } catch {
            print("Failed to save data")
        }
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    

}
