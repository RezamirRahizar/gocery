//
//  goceryApp.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import SwiftUI
import CoreData

@main
struct goceryApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            //Core Data stuff
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            NavigationStack(path: $coordinator.path) {
                coordinator.start()
            }
        }
    }
}
