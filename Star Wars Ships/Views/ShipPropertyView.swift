//
//  ShipPropertyView.swift
//  Star Wars Ships
//
//  Created by 🦋 Aurelie 🦋 on 17/9/21.
//

import SwiftUI

struct ShipPropertyView: View {
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

struct ShipPropertyView_Previews: PreviewProvider {
    static var previews: some View {
        ShipPropertyView(label: "Name", property: "John", font: .caption)
    }
}
