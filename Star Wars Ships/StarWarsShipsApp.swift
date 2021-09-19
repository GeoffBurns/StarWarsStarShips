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
    var body: some Scene {
        WindowGroup {
           EndlessShipView() 
                .environmentObject(dataSource)
                .environmentObject(favourites)
        }
    }
}

 
