//
//  ContentView.swift
//  Shared
//
//  Created by Tristan Nibbe on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    var mainView: MainView
    
    func toggleNavBar(){
        mainView.toggleNavBar()
    }
    
    var scaledWidth: CGFloat{
        return UIScreen.main.bounds.width;
    }
    
    var scaledHeight: CGFloat{
        return UIScreen.main.bounds.height;
    }
    
    var body: some View {
        ZStack {
            Image("Rainbow")
                .ignoresSafeArea()
                VStack(){
                    
                    VStack{
                        Divider()
                        TitleView(contentView: self)
                        Divider()
                    }
                    GreetingMessageView()
                    Spacer()
                    Spacer()
                    RadialMenuButtonView(mainView: mainView)
                    Spacer()
                }//VStack end
                .frame(width: scaledWidth, height: scaledHeight)
        }//ZStack end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mainView: MainView())
    }
}
