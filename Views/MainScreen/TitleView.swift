//
//  TitleView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct TitleView: View {
    @EnvironmentObject var motherViewModel: MotherViewModel
    
    func toggleNavBar(){
        motherViewModel.setCurrentScreen(screen: screenType.navbar)
    }
    
    var body: some View {
        HStack(alignment: .center){
            Button(action:
                    toggleNavBar,
                label: {
                    Image(systemName: "text.justify")
                        .foregroundColor(.black)
            })//button end
            Spacer()
            Text("Simple Mindfulness")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
        }//Hstack
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView().environmentObject(MotherViewModel())
    }
}
