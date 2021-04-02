//
//  NavBarView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct TabBarView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        UITabBar.appearance().barTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        
    }
    
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Text("Main")

                    Image(systemName: "house")
                        .foregroundColor(.black)
                }
            LogView()
                .tabItem{
                    Text("Log")
                    Image(systemName: "book")
                        .foregroundColor(.black)
                }
            SettingsView()
                .tabItem{
                    Text("Settings")
                    Image(systemName: "gear")
                        .foregroundColor(.black)
                }
        }
        .accentColor(Color.white)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
