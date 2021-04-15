//
//  SuggestionView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/10/21.
//

import SwiftUI

struct SuggestionView: View {
    @State var currentSuggestionIndex = 0
    var mainView: MainView
    var suggestion: [String]
    
    func iterateSuggestionIndex(){
        currentSuggestionIndex += 1
        if(currentSuggestionIndex >= suggestion.count){
            currentSuggestionIndex = 0
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(
                    action: mainView.toggleSuggestionScreen
                ,label: {
                    Image(systemName: "return")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                })
                .padding(.trailing)
            }
            
            Spacer()
            
            VStack{
                Text(suggestion[currentSuggestionIndex])
                Button(action: iterateSuggestionIndex
                ,label: {
                    Text("Show another suggestion")
                })
                .padding()
            }
            Spacer()
        }
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(mainView: MainView(), suggestion: ["1","2"])
    }
}
