//
//  ShipListViewModel.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//
 
import Combine
import SwiftUI
 

    
class ShipListViewModel: ObservableObject  {
    var fetcher: JsonFetcher = JsonFetcher()
    static var urlOfFirstPage = "https://swapi.dev/api/starships"
    @Published var ships = [Ship.Loading]
    @Published var count = 0
    @Published var previous = ""
    @Published var next = ""
    
    var cancellables = Set<AnyCancellable>()
    func fetchShipsData(url : String ) -> AnyPublisher<ShipResponse, FetchError> {
        return fetcher.fetch(from: url) 
    }

    func getFirstShips()
    {
        getPageOfShips(url: ShipListViewModel.urlOfFirstPage)
    }
    func getMoreShips(url: String)
    {
        if url.isEmpty { return }
        getPageOfShips(url:url)
    }
    func getNextShips()
    {
            getMoreShips(url:next)
    }
    func getPreviousShips()
    {
        getMoreShips(url:previous)
    }
    func getShips(url : String, responseHandler: @escaping (ShipResponse) -> Void) {
        let cancellable = self.fetchShipsData(url: url)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Fetch Failed: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: responseHandler)
        
        cancellables.insert(cancellable)
    }
    func getPageOfShips(url : String) {
        getShips(url:url){ [self] (response) in
                self.ships = response.results
                self.count = response.count
                self.previous = response.previous ?? ""
                self.next = response.next ?? ""
        }
    }
    /*
     
     /// ToDo Prefetch Data if network access is unconstrained
     
    func getAllShips(url : String) {
        getShips(url:url){ [self] (response) in
                self.ships = response.results
                self.count = response.count
                self.getRemainingShips(url: response.next ?? "")
        }
    }
    func getRemainingShips(url : String) {
        if url.isEmpty { return }
        getShips(url:url){ [self] (response) in
            self.ships += response.results
            self.getRemainingShips(url: response.next ?? "")
        }
    }
 */
}

