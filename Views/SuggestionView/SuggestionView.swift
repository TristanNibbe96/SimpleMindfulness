//
//  SuggestionView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/10/21.
//

import SwiftUI

struct SuggestionView: View {
    @EnvironmentObject var motherViewModel: MotherViewModel
    @State var I = 0
    let viewModel = SuggestionViewModel()
    var suggestions: [String] = [""]
    var suggestionType: emotionType = emotionType.angry
    var backgroundColor: Color = .blue

    init(suggestionType: emotionType){
        self.suggestionType = suggestionType
        self.suggestions = viewModel.getSuggestionList(emotion: suggestionType)
        backgroundColor = .blue
    }
    
    func iterateSuggestionIndex(){
        I += 1
        if(I >= suggestions.count){
            I = 0
        }
    }
    
    func toggleSuggestionScreen(){
        motherViewModel.setCurrentScreen(screen: .main)
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
                SuggestionTextView(backgroundColor: backgroundColor, suggestion:suggestions[I])
                Spacer()
                Spacer()
                NextSuggestionButtonView(item: iterateSuggestionIndex)
                Spacer()
            }//VStack
            .frame(width: scaledWidth, height: scaledHeight)
        }//ZStack
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(suggestionType: .angry).environmentObject(MotherViewModel())
    }
}


