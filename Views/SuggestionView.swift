//
//  SuggestionView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/10/21.
//

import SwiftUI

struct SuggestionView: View {
    @State var currentSuggestionIndex = 0
    @State var suggestions: [String] = [""]
    let viewModel = SuggestionViewModel()
    var suggestionType: emotionType = emotionType.angry
    var mainView: MainView
    
    func iterateSuggestionIndex(){
        currentSuggestionIndex += 1
        if(currentSuggestionIndex >= suggestions.count){
            currentSuggestionIndex = 0
        }
    }
    
    func getSuggestionList(){
        suggestions = viewModel.getSuggestionListFromSaved(emotion: suggestionType)
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
                Text(suggestions[currentSuggestionIndex])
                Button(action: iterateSuggestionIndex
                ,label: {
                    Text("Show another suggestion")
                })
                .padding()
            }
            Spacer()
        }.onAppear(){
            getSuggestionList()
        }
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(mainView: MainView())
    }
}
