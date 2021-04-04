//
//  MainView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct MainView: View {
    
    @State var navBarVisible = false
    
    func toggleNavBar(){
        navBarVisible.toggle()
    }
    
    var scaledWidth: CGFloat{
        return UIScreen.main.bounds.width;
    }
    
    var scaledHeight: CGFloat{
        return UIScreen.main.bounds.height;
    }
    
    var body: some View {
        ZStack(alignment: .leading){
                ContentView(mainView: self)
                if self.navBarVisible{
                    NavBarView(mainView: self)
                        .frame(width: scaledWidth,height: scaledHeight)
                        .offset(x: scaledWidth * 0.64)
                }
                
            }// zStack
            .frame(width: scaledWidth, height: scaledHeight)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
