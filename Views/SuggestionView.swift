//
//  SuggestionView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/10/21.
//

import SwiftUI

struct SuggestionView: View {
    @State var emotion = emotionType.angry
    @State var currentSuggestionIndex = 0
    var mainView: MainView
    var suggestion: [String] = ["1","2"]
    
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
            HStack{
                Spacer()
                Text(suggestion[currentSuggestionIndex])
                Spacer()
                Button(action: iterateSuggestionIndex
                ,label: {
                    Image(systemName:"arrow.right")
                })
                    .padding()
            }
            Spacer()
        }
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(mainView: MainView())
    }
}
