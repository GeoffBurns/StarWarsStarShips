//
//  ShipListItemView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

struct ShipListItemView: View {
    var ship : Ship
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10)
        {
            Text(ship.name).bold()
            ShipBuildByView(ship: ship, font: .footnote)
            ShipMeasureView(label: "Length", number: ship.length, units: UnitLength.meters, font:.footnote)
        }
    }
}

struct ShipListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShipListItemView(ship: Ship.Mock)
    }
}
