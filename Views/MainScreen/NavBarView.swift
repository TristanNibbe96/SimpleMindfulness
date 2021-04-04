//
//  NavBarView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct NavBarView: View {
    var mainView: MainView
    
    func toggleNavBar(){
        mainView.toggleNavBar()
    }
    
    var body: some View {
        NavigationView{
            List{
                ZStack{
                    NavigationLink(
                        destination: LogView(),
                        label: {
                            HStack{
                                Text("Log")
                                Spacer()
                                Image(systemName: "book")
                            }
                    })//end nav link
                        HStack{
                            Spacer()
                        Image(systemName: "chevron.right")
                        }
                }//End ZStack


                ZStack{
                    NavigationLink(
                        destination: SettingsView(),
                        label: {
                            HStack{
                                Text("Settings")
                                Spacer()
                                Image(systemName: "gear")
                            }
                    })//end nav link
                        HStack{
                            Spacer()
                        Image(systemName: "chevron.right")
                        }
                }//End ZStack
                
                Button(action: toggleNavBar
                ,label: {
                    HStack{
                        Text("Main")
                        Spacer()
                        Image(systemName: "house")
                        Image(systemName: "chevron.right")
                    }
                })
            }//End list
            .navigationBarTitle("Navigation")
            .navigationBarHidden(false)
        }//end nav view
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView(mainView: MainView())
    }
}
