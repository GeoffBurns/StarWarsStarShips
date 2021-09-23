//
//  Favourites.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import Foundation
import CoreData
import Utilities
import Persistence

 
class Favourites: PersistentSet<FavoriteShip,String>  {
    init() {
        super.init(containerName: "Main", entityName: "FavoriteShip")
    }
    override func assign(_ entity: FavoriteShip, key: String)
    {
        entity.accessUrl = key
    }
    override func has(_ entity: FavoriteShip, key: String) -> Bool
     {
         return entity.accessUrl == key
     }
}
