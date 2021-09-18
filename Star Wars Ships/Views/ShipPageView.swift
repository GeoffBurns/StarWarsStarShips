//
//  ShipListView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

struct ShipPageView: View {

    @EnvironmentObject var listViewModel : ShipListViewModel
    var body: some View {
        NavigationView {
            VStack{
                TopNavigationView()
                ShipListView()
                BottomNavigationView()
            }
            .navigationBarTitle("Star Wars Starships")
        }
        .onAppear {
            self.listViewModel.getFirstShips()
        }
    }
}
struct ShipListView: View {
    @EnvironmentObject var listViewModel : ShipListViewModel
    
    var body: some View {
        VStack {
                List(self.listViewModel.ships, id: \.url) { ship in
                   if ship.name == Ship.Loading.name
                    {
                    ShipsLoadingView()
                    }
                   else
                    {
                    HStack (alignment: .top) {
                        NavigationLink(
                            destination: ShipDetailsView(ship: ship))
                            {
                                ShipListItemView(ship: ship)
                             }.disabled(self.listViewModel.ships.count < 2)
                        FavouriteView(ship: ship, size: 15)
                        }
                    }
                }
        }
    }
}

struct ShipListView_Previews: PreviewProvider {
    static var previews: some View {
        ShipPageView().environmentObject(ShipListViewModel())
    }
}
