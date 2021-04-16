//
//  SuggestionView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/10/21.
//

import SwiftUI

struct SuggestionView: View {
    @State var currentSuggestionIndex = 0
    let viewModel = SuggestionViewModel()
    let suggestions: [String]
    var suggestionType: emotionType = emotionType.angry
    var mainView: MainView

    init(mainView: MainView, suggestionType: emotionType = emotionType.angry){
        self.suggestions = viewModel.getSuggestionListFromSaved(emotion: suggestionType)
        self.mainView = mainView
    }
    
    func iterateSuggestionIndex(){
        currentSuggestionIndex += 1
        if(currentSuggestionIndex >= suggestions.count){
            currentSuggestionIndex = 0
        }
    }
    
    
    var body: some View {
        ZStack{
            Image("Rainbow")
                .colorMultiply(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .saturation(0.7)

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
                }//HStack
                
                Spacer()
                
                VStack{
                    Text(suggestions[currentSuggestionIndex])
                    Button(action: iterateSuggestionIndex
                    ,label: {
                        Text("Show another suggestion")
                    })
                    .padding()
                }//VStack
                Spacer()
            }//VStack
        }//ZStack
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(mainView: MainView())
    }
}
