//
//  NavigationView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

struct TopNavigationView: View {
    @EnvironmentObject var listViewModel : ShipListViewModel
    
    var body: some View {
        if !listViewModel.previous.isEmpty {
            Button("Previous") {
                listViewModel.getPreviousShips()
            }.padding(10)
        }
    }
}


struct BottomNavigationView: View {
@EnvironmentObject var listViewModel : ShipListViewModel
    
var body: some View {
    if !listViewModel.next.isEmpty {
        Button("Next") {
            listViewModel.getNextShips()
        }.padding(10)
    }
  }
}
struct TopNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavigationView().environmentObject(ShipListViewModel())
    }
}
 
