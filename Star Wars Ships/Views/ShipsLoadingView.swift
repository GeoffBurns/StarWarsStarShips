//
//  ShipsLoadingView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

struct ShipsLoadingView: View {
 
var body: some View {
  
    VStack {
        Text("Fetching Data").foregroundColor(.gray)
        ProgressView()
     }
}
}

struct ShipsLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ShipsLoadingView()
    }
}
