//
//  view+splitView.swift
//  Star Wars Ships
//
//  Created by Geoff Burns on 20/9/21.
//

import Foundation
import SwiftUI
 
 
struct SplitViewModifier: ViewModifier {
    let isSplit: Bool
    func body(content: Content) -> some View {
        if isSplit
        {
            content.navigationViewStyle(DoubleColumnNavigationViewStyle())
        } else
        {
            content.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct SplitViewOnLandscapeModifier: ViewModifier {
    @State private var orientation = UIDevice.current.orientation
    private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    private var isSplit : Bool { idiom == .pad && !orientation.isPortrait }
    
    func body(content: Content) -> some View {
            content
                .onRotate { newOrientation in
                     
                    orientation = newOrientation
                    }
                    .navigationViewStyleChoice(isSplit)
    }
}
extension View {
  
    public func navigationViewStyleChoice(_ isSplit: Bool) -> some View
        {
            self.modifier(SplitViewModifier(isSplit: isSplit))
        }
    
    public func splitOnLandscapeMavigationViewStyle() -> some View
      {
          self.modifier(SplitViewOnLandscapeModifier())
      }

}

