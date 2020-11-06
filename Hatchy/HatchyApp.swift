//
//  HatchyApp.swift
//  Hatchy
//
//  Created by Mete Alp Kizilcay on 6.11.2020.
//

import SwiftUI

@main
struct HatchyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
