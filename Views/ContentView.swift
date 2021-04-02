//
//  ContentView.swift
//  Shared
//
//  Created by Tristan Nibbe on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    func refreshScreen(){
        GreetingMessageView().updateSavedName()
    }
    
    var body: some View {
        ZStack {
            Image("Rainbow")
                .ignoresSafeArea()
            VStack{
                Spacer()
                GreetingMessageView()
                Spacer()
                RadialMenuButtonView()
                Spacer()
            }//VStack end
        }//ZStack end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
