//
//  ContentView.swift
//  Shared
//
//  Created by Tristan Nibbe on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingPopover = false
    func function(){
        print("asdfasdf")
        showingPopover = true
    }
    
    var body: some View {
        ZStack {
            Image("Rainbow")
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Hello, _name_ how are you today?")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: 300)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(25)
                
                Spacer()
                
                Button(action: {self.function()}
                    ,label: {
                    ZStack{
                        Text("I am feeling...")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(20)
                })//Button End
                .contextMenu(ContextMenu(menuItems: {
                    /*@START_MENU_TOKEN@*/Text("Menu Item 1")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
                }))

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
