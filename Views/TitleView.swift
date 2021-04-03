//
//  TitleView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/2/21.
//

import SwiftUI

struct TitleView: View {
    var contentView: ContentView
    
    func toggleNavBar(){
        contentView.toggleNavBar()
    }
    
    var body: some View {
        HStack(alignment: .center){
            Text("Simple Mindfulness")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Button(action:
                    toggleNavBar,
                label: {
                    Image(systemName: "book")
            })//button end
        }//Hstack
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(contentView: ContentView(mainView: MainView()))
    }
}
