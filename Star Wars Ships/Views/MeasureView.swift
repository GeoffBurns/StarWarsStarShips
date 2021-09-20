//
//  MeasureView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 19/9/21.
//

import SwiftUI
import Utilities

struct MeasureView: View {
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

struct MeasureView_Previews: PreviewProvider {
    static var previews: some View {
        MeasureView(label:"Length", number: "1,250", units: UnitLength.meters, font: .caption)
    }
}
