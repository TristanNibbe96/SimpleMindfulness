//
//  RadialMenuButtonView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct RadialMenuButtonView: View {
    func openRadialMenu(){
        print("asdfasdf")
    }
    
    var body: some View {
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
        )
    }
}

struct RadialMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuButtonView()
    }
}
