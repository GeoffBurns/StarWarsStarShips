//
//  Fetcher.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//


import Foundation
import Combine

struct Fetcher {
    
    static let cache = CustomCache<String, Decodable>()
    static let shared = Fetcher()
    
    func fetch<T>(from url: String) -> AnyPublisher<T, FetchError> where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // check cache for data
        if let cachedValue = Fetcher.cache.value(forKey: url),
           let value = cachedValue as? T
        {
            // get data from cache
            return Just(value)
                // change AnyPublisher<T, Never> to AnyPublisher<T, FetchError>
                .mapError { _ in  FetchError.never }
                .eraseToAnyPublisher()
        }
        // fetch data if not in cache
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: url)!)
            .receive(on: DispatchQueue.main)
            // url badly formed?
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<T, FetchError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                    // http success
                    return Just(data)
                        .decode(type: T.self, decoder: decoder)
                        .mapError {error in .jsonError(error.localizedDescription)}
                        .map { data in 
                            //  cache data
                            Fetcher.cache.insert(data, forKey: url)
                            return data
                        }
                        .eraseToAnyPublisher()
                    } else {
                        // http failure
                        return Fail(error: FetchError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                // url badly formed?
                return Fail(error: FetchError.unknown)
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }

 
}
