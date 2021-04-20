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
    var suggestionScreenVisible: Binding<Bool>
    let viewModel = SuggestionViewModel()
    let suggestions: [String]
    var suggestionType: emotionType = emotionType.angry
    var mainView: MainView
    var backgroundColor: Color

    init(mainView: MainView, suggestionType: emotionType = emotionType.angry, screenVisible: Binding<Bool>){
        self.suggestions = viewModel.getSuggestionListFromSaved(emotion: suggestionType)
        self.mainView = mainView
        backgroundColor = .blue
        self.suggestionScreenVisible = screenVisible
    }
    
    func iterateSuggestionIndex(){
        currentSuggestionIndex += 1
        if(currentSuggestionIndex >= suggestions.count){
            currentSuggestionIndex = 0
        }
        currentSuggestion = suggestions[currentSuggestionIndex]
    }
    
    func toggleSuggestionScreen(){
        suggestionScreenVisible.wrappedValue.toggle()
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
                        action: toggleSuggestionScreen
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


