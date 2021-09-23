//
//  PeopleViewModel.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import Foundation
import Combine
import SwiftUI
import JsonFetchUI

 
class PeopleViewModel: FetchViewModel {
    @Published var people : [People] = []
  
    func getPerson(url : String, responseHandler: @escaping (People) -> Void) {
        getData(url: url, responseHandler: responseHandler)
    }
    func getPeople(urls : [String]) {
        guard let head = urls.first else { return  }
        let tail = Array(urls.dropFirst())
        getPerson(url:head){ [self] (response) in
            self.people.append(response)
            getPeople(urls : tail )
        }
    }
}
