//
//  ContentView.swift
//  Shared
//
//  Created by Tristan Nibbe on 3/31/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var motherViewModel: MotherViewModel
    
    func toggleNavBar(){
        motherViewModel.setCurrentScreen(screen: screenType.navbar)
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
                .resizable()
                .ignoresSafeArea()
                VStack(){
                    
                    VStack{
                        Divider()
                        TitleView()
                        Divider()
                    }
                    GreetingMessageView()
                    Spacer()
                    Spacer()
                    RadialMenuButtonView()
                    Spacer()
                }//VStack end
                .frame(width: scaledWidth, height: scaledHeight)
        }//ZStack end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(MotherViewModel())
    }
}
