//
//  ShipDetailsView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 16/9/21.
//

import SwiftUI

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits
                                                .union(CharacterSet.punctuationCharacters)
                                                .inverted) == nil
    }
}

struct ShipTitleView: View {
    var ship : Ship
    var body: some View {
            VStack (alignment: .leading, spacing: 15) {
              HStack (alignment: .top) {
                Text(ship.model).font(.subheadline).bold()
                
                Spacer()
                FavouriteView(ship: ship, size: 30)
              }
            }
        }
}
struct ShipBuildByView: View {
    var ship : Ship
    var font  = Font.caption
    var body: some View {
        HStack (alignment: .top) {
            Text("Build by ").font(font).bold()
            Spacer()
            Text(ship.manufacturer).font(font).italic()
        }
    }
}
struct ShipMetricView: View {
    var label : String
    var number : String
    var units : String
    var font : Font
    var body: some View {
        let value = number.isNumber
                ? number + " " + units
                : number
        HStack (alignment: .top) {
                Text(label).font(font).bold()
                Spacer()
                Text( value ).font(font)
        }
    }
}
struct ShipPropertyView: View {
    var label : String
    var property : String
    var font : Font
    var body: some View {
        HStack (alignment: .top) {
                Text(label).font(font).bold()
                Spacer()
                Text( property ).font(font)
        }
    }
}
struct ShipCapacityView: View {
    var ship : Ship
    var font  = Font.caption
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            ShipPropertyView(label: "Crew", property: ship.crew, font: font)
            ShipPropertyView(label: "Passengers", property: ship.passengers,font: font)
            ShipMetricView(label: "Capacity", number: ship.cargoCapacity, units: "kg",font: font)
            ShipPropertyView(label: "Consumables", property: ship.consumables, font: font)
        }
    }
}
struct ShipEngineView: View {
        var ship : Ship
        var font  = Font.caption
        var body: some View {
            let description = "class " + ship.hyperdriveRating + " hyperdrive"
            let description2 =  ship.MGLT + " MGLT / hour"
            
            VStack (alignment: .leading, spacing: 10) {
              HStack (alignment: .top) {
                Text("Engine ").font(font).bold()
                Spacer()
                Text(description).font(font)
              }
              HStack (alignment: .top) {
                        Spacer()
                        Text(description2).font(font)
               }
            }
        }
}


struct ShipDetailsView: View {
    var ship : Ship
    var font  = Font.caption
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            ShipTitleView(ship:ship)
            ShipBuildByView(ship:ship)
            ShipMetricView(label: "Cost", number: ship.costInCredits, units: "credits", font: font)
            ShipMetricView(label: "Length", number: ship.length, units: "m", font: font)
            ShipMetricView(label: "Atm Speed", number: ship.maxAtmospheringSpeed, units: "kph", font: font)
            ShipCapacityView(ship:ship)
            ShipEngineView(ship:ship)
            ShipPropertyView(label: "Starship Class", property: ship.starshipClass, font: font)
            Spacer()
            HStack
            {
                LogoView(logo: "rebel")
                LogoView(logo: "imperial")
                LogoView(logo: "republic")
                LogoView(logo: "jedi2")
            }
        }
        .padding(10)
    .navigationTitle(ship.name)
    .navigationBarTitleDisplayMode(.inline)
    }
}
    

struct ShipDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShipDetailsView(ship: Ship.Mock)
    }
}
 
