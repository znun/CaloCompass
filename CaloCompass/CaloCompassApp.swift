//
//  CaloCompassApp.swift
//  CaloCompass
//
//  Created by Mahmudul Hasan on 21/1/24.
//

import SwiftUI

@main
struct CaloCompassApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
