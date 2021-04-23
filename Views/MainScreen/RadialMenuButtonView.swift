//
//  RadialMenuButtonView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct RadialMenuButtonView: View {
    @State var radialMenuOpen = false
    var motherView: MotherView
    
    func openRadialMenu(){
        radialMenuOpen = true
    }
    
    func closeRadialMenuAndOpenSuggestion(openSuggestion: Bool){
        radialMenuOpen = false
        if(openSuggestion){
            motherView.toggleSuggestionScreen()
        }
    }
    
    var body: some View {
        ZStack{
            Button(action: {self.openRadialMenu()}
                ,label: {
                ZStack{
                    Text("I am feeling...")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(20)
                }
            )//EndButton
            if self.radialMenuOpen{
                RadialMenuView(radialMenuButton: self)
            }
        }//End ZStack
    }
}

struct RadialMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuButtonView(motherView: MotherView())
    }
}
