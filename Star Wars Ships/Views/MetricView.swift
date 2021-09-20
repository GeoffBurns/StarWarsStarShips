//
//  MetricView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import SwiftUI

struct MetricView: View {
    var label : String
    var number : String
    var units : String
    var font : Font
    var body: some View {
        let value = number.isNumberWithCommas
                ? number + " " + units
                : number
        HStack (alignment: .top) {
                Text(label).font(font).bold()
                Spacer()
                Text( value ).font(font)
        }
    }
}


struct MetricView_Previews: PreviewProvider {
    static var previews: some View {
        MetricView(label: "Width", number: "50", units: "cm", font: .caption).padding()
    }
}
