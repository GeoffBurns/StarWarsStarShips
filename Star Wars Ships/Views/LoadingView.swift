//
//  LoadingView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

struct LoadingView: View {
 
var body: some View {
  
    VStack (alignment:  .center) {
        Text("Fetching Data").foregroundColor(.gray)
        ProgressView()
     }
}
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
