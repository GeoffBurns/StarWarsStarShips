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
    func measure(unit:Unit) -> String {
        
        let numberWithoutCommas = replacingOccurrences(of: ",", with: "")
        let numberInDouble = Double(numberWithoutCommas)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .naturalScale
        return numberInDouble == nil
            ? self :
            formatter.string(from: Measurement(value: numberInDouble!, unit: unit) )}
    
}
