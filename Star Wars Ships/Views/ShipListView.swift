//
//  ShipListView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI


struct ShipListView: View {
    @EnvironmentObject var listViewModel : ShipListViewModel

    var body: some View {
        NavigationView {
            VStack{
                TopNavigationView()
            List(self.listViewModel.ships) { ship in
                if ship.id == Ship.Loading.id
                {
                    ShipsLoadingView()
                } else
                {
                    HStack (alignment: .top) {
                        NavigationLink(
                            destination: ShipDetailsView(ship: ship))
                            {
                                ShipListItemView(ship: ship)
                            }
                        FavouriteView(ship: ship, size: 15)
                    }
                }
            }
                BottomNavigationView()
            }
            .navigationBarTitle("Star Wars Starships")
        }
        .onAppear {
            self.listViewModel.getFirstShips()
        }
    }
}

struct ShipListView_Previews: PreviewProvider {
    static var previews: some View {
        ShipListView()
    }
}
