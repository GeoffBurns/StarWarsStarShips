//
//  ShipMeasureView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 19/9/21.
//

import SwiftUI

struct ShipMeasureView: View {
    var label : String
    var number : String
    var units : Unit
    var font : Font
    var value :  String  { number.measure(unit: units) }
    var body: some View {
         
        HStack (alignment: .top) {
                Text(label).font(font).bold()
                Spacer()
                Text( value ).font(font)
             
        }
    }
}

struct ShipMeasureView_Previews: PreviewProvider {
    static var previews: some View {
        ShipMeasureView(label:"Length", number: "1,250", units: UnitLength.meters, font: .caption)
    }
}
