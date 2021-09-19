//
//  DatePropertyView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 17/9/21.
//

import SwiftUI

struct DatePropertyView: View {
    var label : String
    var property : String
    var value : String {
        let dateString = property.components(separatedBy: "T")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString.first ?? "")
        dateFormatter.dateFormat = "d MMM y"
        return dateFormatter.string(from: date ?? Date())
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
        DatePropertyView(label: "Edited", property: "2014-12-20T21:23:49.870000Z", font: .caption)
    }
}
