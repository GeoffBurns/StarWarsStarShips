//
//  ShipResponse.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import Foundation

struct ShipResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Ship]
}


