//
//  ShipPropertyView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import SwiftUI

struct PropertyView: View {
    var label : String
    var property : String
    var font : Font
    var body: some View {
        HStack (alignment: .top) {
                Text(label).font(font).bold()
                Spacer()
                Text( property ).font(font)
        }
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(label: "Name", property: "John", font: .caption)
    }
}
