//
//  LogoView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import SwiftUI

struct LogoView: View {
        @Environment(\.colorScheme) var colorScheme

        var logo : String
        var body: some View {
            Image(colorScheme == .dark ? logo + "_d" : logo).resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.14)
        }
}
struct LogosView: View { 
        var body: some View {
            HStack
            {
                LogoView(logo: "rebel")
                LogoView(logo: "imperial")
                LogoView(logo: "republic")
                LogoView(logo: "jedi2")
            }
        }
}
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(logo: "rebel")
    }
}
