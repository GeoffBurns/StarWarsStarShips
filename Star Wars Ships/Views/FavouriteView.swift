//
//  FavouriteView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

struct FavouriteView: View {
    var ship : Ship
    var size : CGFloat
    @EnvironmentObject var favs : Favourites
    
    var body: some View {
            Button(action: {
                favs.toggle(ship.url)
            }) {
                if favs.isFavourite(ship.url)
                {
                    Image(systemName: "heart.fill").font(.system(size: size))
                }
                else
                {
                    Image(systemName: "heart").font(.system(size: size))
                }
            }.buttonStyle(PlainButtonStyle())
    }
}
struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView(ship: Ship.Mock, size: 60).environmentObject(Favourites())
    }
}
