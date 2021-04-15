//
//  EditSuggestionsView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI


struct EditSuggestionsView: View {
    @ObservedObject var viewModel : EditSuggestionsViewModel = EditSuggestionsViewModel()
    @State private var enteredName: String = EditSuggestionsViewModel().getSavedName()
    @State private var currentlySelectedEmotion = emotionType.angry
    @State private var angrySuggestions: [String] = EditSuggestionsViewModel().getSuggestions().AngrySuggestions
    @State private var blehSuggestions: [String] = EditSuggestionsViewModel().getSuggestions().BlehSuggestions
    @State private var happySuggestions: [String] = EditSuggestionsViewModel().getSuggestions().HappySuggestions
    @State private var sadSuggestions: [String] = EditSuggestionsViewModel().getSuggestions().SadSuggestions
    

    
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
    @State var showingDateLoggingInfo = false

    var body: some View {
        VStack{
            HStack{
                Text("Name: ")
                    .padding(.horizontal)
                TextField("\(viewModel.getSavedName())", text: $enteredName){_ in
                }onCommit:{viewModel.saveUserName(enteredName: enteredName)}
            }
            .padding()
            HStack{
            Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                    Text("Allow date logging. ")
                })
                Button(action: {showingDateLoggingInfo = true}
                ,label: {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                })
                .alert(isPresented: $showingDateLoggingInfo
                , content: {
                        Alert(title: Text("Title"), message: Text("This information is for your own reference only to better track your mood cycles and patterns. The data saved will not be transmitted, stored, or used by the developers in any way."), dismissButton: .default(Text("OK")))
                })
            }//HStack
            .padding()
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
            .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .navigationBarTitle("Settings",displayMode: .inline)
            .navigationBarHidden(false)
        }//VStack
        .onAppear(){
            currentlySelectedEmotion = emotionType.angry
            let newSuggestions = EditSuggestionsViewModel().getSuggestions()
            angrySuggestions = EditSuggestionsViewModel().getSuggestions().AngrySuggestions
            blehSuggestions = newSuggestions.BlehSuggestions
            happySuggestions = newSuggestions.HappySuggestions
            sadSuggestions = newSuggestions.SadSuggestions
        }
    }
}

struct EditSuggestionsView_Preview: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
