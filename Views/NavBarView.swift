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
            List{
                NavigationLink(
                    destination: LogView(),
                    label: {
                        HStack{
                            Text("Log")
                            Spacer()
                            Image(systemName: "book")
                        }
                })//end nav link
                NavigationLink(
                    destination: SettingsView(),
                    label: {
                        HStack{
                            Text("Settings")
                            Spacer()
                            Image(systemName: "gear")
                        }
                })//end nav link
            }//End list
        }//end nav view
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
