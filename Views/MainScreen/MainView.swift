//
//  ContentView.swift
//  Shared
//
//  Created by Tristan Nibbe on 3/31/21.
//

import SwiftUI

struct MainView: View {
    var motherView: MotherView
    
    func toggleNavBar(){
        motherView.toggleNavBar()
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
                        TitleView(mainView: self)
                        Divider()
                    }
                    GreetingMessageView()
                    Spacer()
                    Spacer()
                    RadialMenuButtonView(motherView: motherView)
                    Spacer()
                }//VStack end
                .frame(width: scaledWidth, height: scaledHeight)
        }//ZStack end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(motherView: MotherView())
    }
}
