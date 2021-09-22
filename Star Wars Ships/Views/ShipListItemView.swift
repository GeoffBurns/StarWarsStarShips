//
//  ShipListItemView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

struct ShipSummaryView: View {
    var ship : Ship
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10)
        {
            Text(ship.name).bold()
            ShipBuildByView(ship: ship, font: .footnote)
            MeasureView(label: "Length", number: ship.length, units: UnitLength.meters, font:.footnote)
        }
    }
}
struct LoadedShipListItem: View {
    var ship : Ship
    
    var body: some View {
          HStack (alignment: .top) {
            ZStack {
                  ShipSummaryView(ship: ship)
                  NavigationLink(
                    destination: ShipDetailsView(ship: ship))
                    {
                    EmptyView()
                    }
                  .frame(width: 0)
                  .opacity(0)
                  }
            VStack  (alignment: .center, spacing: 15){
              FavouriteView(ship: ship, size: 15)
              Image(systemName: "chevron.right")
                .font(.system(size: 15))
                .foregroundColor(.gray)
            }
          }
    }
}
struct ShipListItemView: View {
    var ship : Ship
    
    var body: some View {
        if ( ship.name == Ship.Loading.name)
        {
            LoadingView()
        }
        else
        {
            LoadedShipListItem(ship: ship)
        }
    }
}

struct ShipListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShipListItemView(ship: Ship.Mock)
    }
}
