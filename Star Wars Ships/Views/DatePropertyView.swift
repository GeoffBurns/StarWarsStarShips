//
//  DatePropertyView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import SwiftUI

struct DatePropertyView: View {
    var label : String
    var property : Date
    var value : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y HH:mm"
        return dateFormatter.string(from: property)
    }
    var font : Font
    var body: some View {
        HStack (alignment: .top) {
                Text(label).font(font).bold()
                Spacer()
                Text( value ).font(font)
        }
    }
}
 

struct DatePropertyView_Previews: PreviewProvider {
    static var previews: some View {
        DatePropertyView(label: "Edited", property: Date(), font: .caption)
    }
}
