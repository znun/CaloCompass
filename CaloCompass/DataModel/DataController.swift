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
}
