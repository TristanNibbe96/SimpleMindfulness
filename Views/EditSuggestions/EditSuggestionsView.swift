//
//  EditSuggestionsView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI


struct EditSuggestionsView: View {
    @ObservedObject var viewModel : EditSuggestionsViewModel = EditSuggestionsViewModel()
    @State private var currentlySelectedEmotion = emotionType.angry
    @State private var angrySuggestions: [String] = EditSuggestionsViewModel().getSuggestions().AngrySuggestions
    @State private var blehSuggestions: [String] = EditSuggestionsViewModel().getSuggestions().BlehSuggestions
    @State private var happySuggestions: [String] = EditSuggestionsViewModel().getSuggestions().HappySuggestions
    @State private var sadSuggestions: [String] = EditSuggestionsViewModel().getSuggestions().SadSuggestions

    
    init(){
        let newSuggestions = viewModel.getSuggestions()
        currentlySelectedEmotion = emotionType.angry

        angrySuggestions = newSuggestions.AngrySuggestions
        blehSuggestions = newSuggestions.BlehSuggestions
        happySuggestions = newSuggestions.HappySuggestions
        sadSuggestions = newSuggestions.SadSuggestions
    }
    
    func saveSuggestions(){
        viewModel.saveSuggestions(angry: angrySuggestions, bleh: blehSuggestions, happy: happySuggestions, sad: sadSuggestions, name: "Suggestions")
    }
    
    func changeSuggestions(suggestionType: emotionType, suggestions: [String]){
        switch suggestionType {
        case emotionType.angry:
            angrySuggestions = suggestions
        case emotionType.bleh:
            blehSuggestions = suggestions
        case emotionType.happy:
            happySuggestions = suggestions
        case emotionType.sad:
            sadSuggestions = suggestions
        }
    }

    var body: some View {
        VStack{
            TabView{
                TextFieldListView(stringList: angrySuggestions, editSuggestionsView: self,emotion: emotionType.angry)
                    .tabItem {
                        Image("Icon_Angry")
                        Text("Angry")
                    }
                TextFieldListView(stringList: blehSuggestions, editSuggestionsView: self, emotion: emotionType.bleh)
                    .tabItem {
                        Image("Icon_Bleh")
                        Text("Bleh")
                    }
                TextFieldListView(stringList: happySuggestions, editSuggestionsView: self,emotion: emotionType.happy)
                    .tabItem {
                        Image("Icon_Happy")
                        Text("Happy")
                    }
                TextFieldListView(stringList: sadSuggestions, editSuggestionsView: self, emotion: emotionType.sad)
                    .tabItem {
                        Image("Icon_Sad")
                        Text("Sad")
                    }

            }// Tabview
        }//VStack
    }
}

struct EditSuggestionsView_Preview: PreviewProvider {
    static var previews: some View {
        EditSuggestionsView()
    }
}
