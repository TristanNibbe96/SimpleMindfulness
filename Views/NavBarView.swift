//
//  NavBarView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        NavigationView{
            ContentView()
            .navigationBarItems(trailing:
                NavigationLink(destination: SettingsView()){
                Image(systemName: "gear")
            })
            .navigationBarTitle("Simple Mindfulness")
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
