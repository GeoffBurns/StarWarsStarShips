//
//  FilmViewModel.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import Foundation
import Combine
import SwiftUI
import JsonFetchUI

class FilmViewModel: FetchViewModel {
    @Published var films : [Film] = []
      
    func getFilm(url : String, responseHandler: @escaping (Film) -> Void) {
            getData(url: url, responseHandler: responseHandler) 
    }
    func getFilms(urls : [String]) {
        guard let head = urls.first else { return  }
        let tail = Array(urls.dropFirst())
        getFilm(url:head){ [self] (response) in
            self.films.append(response)
            getFilms(urls : tail )
        }
    }
}

 
