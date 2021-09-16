//
//  string+isNumber.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import Foundation

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits
                                                .union(CharacterSet.punctuationCharacters)
                                                .inverted) == nil
    }
}
