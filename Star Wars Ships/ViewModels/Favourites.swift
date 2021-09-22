//
//  Favourites.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import Foundation
import CoreData
 
class Favourites: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var favorities: [FavoriteShip] = []
    
    init() {
        container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        load()
    }
    func load() {
        let request = NSFetchRequest<FavoriteShip>(entityName: "FavoriteShip")
        
        do {
            favorities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    func like(url: String) {
        let newFavoriteShip = FavoriteShip(context: container.viewContext)
        newFavoriteShip.accessUrl = url
        saveData()
    }
    func unlike(entity: FavoriteShip) {
        container.viewContext.delete(entity)
        saveData()
    }
    func saveData() {
        do {
            try container.viewContext.save()
            load()
        } catch let error {
            print("CoreData Error saving. \(error)")
        }
    }
    func getFavourite(_ url: String) -> FavoriteShip?
    {
       return favorities.first { $0.accessUrl == url }
   
    }
    func isFavourite(_ url: String) -> Bool
    {
       return getFavourite(url) != nil
    }
    func toggle(_ url: String)
    {
        if let fav = getFavourite(url)
        {
            unlike(entity: fav)
        }
        else
        {
            like(url: url)
        }
    }
}
