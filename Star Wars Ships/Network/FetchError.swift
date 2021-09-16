//
//  FetchError.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import Foundation

enum FetchError: Error {
    case jsonError(String)
    case httpError(Int)
    case unknown
    case never
}
