//
//  Star_Wars_ShipsApp.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

@main
struct StarWarsShipsApp: App {
    var body: some Scene {
        WindowGroup {
            ShipListView()
                .environmentObject(ShipListViewModel())
                .environmentObject(Favourites())
        }
    }
}

 
