//
//  MainView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct MainView: View {
    
    @State var navBarVisible = false
    
    func showNavBar(){
        navBarVisible = true
    }
    
    var body: some View {
       GeometryReader{geometry in
            ZStack{
                ContentView()
                if self.navBarVisible{
                    NavBarView()
                        .frame(width: geometry.size.width/2,height: geometry.size.height)
                }
            }// zStack
            .frame(width: geometry.size.width, height: geometry.size.height)
       }//End geometry
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()


    }
}
