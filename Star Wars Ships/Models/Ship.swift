//
//  Ships.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import Foundation
 

struct Ship: Codable, Identifiable {
    let id = UUID() // ToDo define a CodingKeys
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let hyperdriveRating: String
    let MGLT: String
    let starshipClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
     
    static let Mock = Ship(name: "TestShip", model: "TestModel", manufacturer: "" , costInCredits: "", length: "", maxAtmospheringSpeed: "", crew: "", passengers: "", cargoCapacity: "", consumables: "", hyperdriveRating: "", MGLT: "", starshipClass: "TestFighter", pilots: [], films:[],
                           created: "", edited:"", url: "")
    
    
    static let Loading = Ship(name: "Fetching Data", model: "", manufacturer: "" , costInCredits: "", length: "", maxAtmospheringSpeed: "", crew: "", passengers: "", cargoCapacity: "", consumables: "", hyperdriveRating: "", MGLT: "", starshipClass: "", pilots: [], films:[],
                              created: "", edited:"", url: "")
}

/*
 
/// ToDo fetch film and people data to show on Detail screen
 
struct Film: Codable, Identifiable {
    let id = UUID()
    let title: String
    let episodeId: String
    let openingCrawl: String
    let director: String
    let producer: String
    let created: String
    let edited: String
    let url: String
}
 
struct People: Codable, Identifiable {
    let id = UUID()
    let name: String
    let created: String
    let edited: String
    let url: String
}
 */
