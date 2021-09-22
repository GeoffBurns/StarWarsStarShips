//
//  Star_Wars_ShipsApp.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

@main
struct StarWarsShipsApp: App {
    @StateObject var dataSource = EndlessShips()
    @StateObject var favourites = Favourites()
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
           EndlessShipView() 
                .environmentObject(dataSource)
                .environmentObject(favourites)
           //     .environment(\.managedObjectContext, persistenceController.container.viewContext)
         }
         .onChange(of: scenePhase) { _ in
             persistenceController.save()
        }
    }
}

 
