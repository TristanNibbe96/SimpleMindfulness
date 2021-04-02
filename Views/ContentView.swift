//
//  ContentView.swift
//  Shared
//
//  Created by Tristan Nibbe on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Image("Rainbow")
                .ignoresSafeArea()
            VStack{
                HStack(alignment: .center){
                    Text("Simple Mindfulness")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                GreetingMessageView()
                RadialMenuButtonView()
            }//VStack end
        }//ZStack end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
