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
    
    
    var body: some View {
        ZStack {
            Image("Rainbow2")
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
        }//ZStack end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(MotherViewModel())
    }
}
