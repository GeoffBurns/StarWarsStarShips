//
//  ShipMetricView.swift
//  Star Wars Ships
//
//  Created by 🦋 Aurelie 🦋 on 17/9/21.
//

import SwiftUI

struct ShipMetricView: View {
    var label : String
    var number : String
    var units : String
    var font : Font
    var body: some View {
        let value = number.isNumber
                ? number + " " + units
                : number
        HStack (alignment: .top) {
                Text(label).font(font).bold()
                Spacer()
                Text( value ).font(font)
        }
    }
}

struct ShipMetricView_Previews: PreviewProvider {
    static var previews: some View {
        ShipMetricView(label: "Width", number: "50", units: "cm", font: .caption)
    }
}
