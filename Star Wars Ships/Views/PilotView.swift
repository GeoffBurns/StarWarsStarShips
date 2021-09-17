//
//  PeopleView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import SwiftUI

struct PilotView: View {
        var ship : Ship
        @StateObject var people = PeopleViewModel()
        var body: some View {
            let withIndex = people.people.enumerated().map{ $0 }
            VStack (alignment: .leading, spacing: 10)
                  {
                    ForEach(withIndex,id: \.element.name) { index, person in
                        HStack {
                            if index == 0
                            {
                                Text( "Pilots" ).bold().font(.caption)
                            }
                            Spacer()
                            Text( person.name).font(.caption)
                         }
                    }
                  }
                .onAppear {
                    self.people.getPeople(urls: ship.pilots)
                }
            }
}

struct PilotView_Previews: PreviewProvider {
    static var previews: some View {
        PilotView(ship: Ship.Mock)
    }
}
 
