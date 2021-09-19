//
//  EndlessShips.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 19/9/21.
//

import SwiftUI
import Combine

 
class EndlessShips : EndlessDataSource<Ship, ShipResponse> {
 
     
    static var urlOfFirstPage = "https://swapi.dev/api/starships"
    
    override func getItems(response :ShipResponse ) -> [Ship]
    {
        return response.results
    }
    override func getUrlOfNextPage(response :ShipResponse ) -> String
    {
        return response.next ?? ""
    }
    override init()
    {
        super.init()
        self.items = [Ship.Loading]
        self.urlOfNextPage = "https://swapi.dev/api/starships"
        loadMoreContent()
    }
}
