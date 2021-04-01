//
//  RadialMenuButtonView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct RadialMenuButtonView: View {
    @State var radialMenuOpen = false
    func openRadialMenu(){
        radialMenuOpen = true
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
                RadialMenuView()
            }
        }//End ZStack
    }
}

struct RadialMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuButtonView()
    }
}
