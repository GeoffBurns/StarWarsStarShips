//
//  Favourites.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import Foundation

class Favourites: ObservableObject {
    
    @Published var favUrls = Set<String>()
    
    func isFavourite(_ url: String) -> Bool
    {
        return favUrls.contains(url)
    }
    func like(_ url: String)
    {
        favUrls.insert(url)
    }
    
    func unlike(_ url: String)
    {
        favUrls.remove(url)
    }
    func toggle(_ url: String)
    {
        if isFavourite(url)
        {
            unlike(url)
        }
        else
        {
            like(url)
        }
    }
}
