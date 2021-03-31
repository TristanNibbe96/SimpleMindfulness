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
            VStack{
                Text("Hello, 4646464646world!")
                    .padding()
                Button(action: {
                    print("buyttopn pressed")
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
