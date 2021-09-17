//
//  FilmView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import SwiftUI

struct FilmView: View {
    var ship : Ship
    @StateObject var films = FilmViewModel()
    var body: some View {
        let withIndex = films.films.enumerated().map{ $0 }
        VStack (alignment: .leading, spacing: 10)
              {
                ForEach(withIndex,id: \.element.title) { index, film in
                    HStack {
                        if index == 0
                        {
                            Text( "Films" ).bold().font(.caption)
                        }
                        Spacer()
                        Text( film.title ).font(.caption)
                     }
                }
              }
            .onAppear {
                self.films.getFilms(urls: ship.films)
            }
        }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(ship: Ship.Mock)
    }
}
