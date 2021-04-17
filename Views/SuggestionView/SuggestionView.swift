//
//  SuggestionView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/10/21.
//

import SwiftUI

struct SuggestionView: View {
    @State var currentSuggestionIndex = 0
    @State var currentSuggestion: String = ""
    let viewModel = SuggestionViewModel()
    let suggestions: [String]
    var suggestionType: emotionType = emotionType.angry
    var mainView: MainView
    var backgroundColor: Color

    init(mainView: MainView, suggestionType: emotionType = emotionType.angry){
        self.suggestions = viewModel.getSuggestionListFromSaved(emotion: suggestionType)
        self.mainView = mainView
        backgroundColor = .blue
        self.currentSuggestion = suggestions[0]
    }
    
    func iterateSuggestionIndex(){
        currentSuggestionIndex += 1
        if(currentSuggestionIndex >= suggestions.count){
            currentSuggestionIndex = 0
        }
        currentSuggestion = suggestions[currentSuggestionIndex]
    }
    
    var scaledWidth: CGFloat{
        return UIScreen.main.bounds.width;
    }
    
    var scaledHeight: CGFloat{
        return UIScreen.main.bounds.height;
    }
    
    var body: some View {
        ZStack{
            Image("Rainbow")
                .colorMultiply(backgroundColor)
                .saturation(2.0)

            VStack{
                HStack{
                    Spacer()
                    Button(
                        action: mainView.toggleSuggestionScreen
                    ,label: {
                        Image(systemName: "return")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    })
                    .padding(.trailing)
                }//HStack
                Spacer()
                SuggestionTextView(backgroundColor: backgroundColor, suggestion:currentSuggestion)
                Spacer()
                Spacer()
                NextSuggestionButtonView(item: iterateSuggestionIndex)
                Spacer()
            }//VStack
            .frame(width: scaledWidth, height: scaledHeight)
        }//ZStack
        .onAppear(){
            currentSuggestion = suggestions[currentSuggestionIndex]
        }
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(mainView: MainView())
    }
}
