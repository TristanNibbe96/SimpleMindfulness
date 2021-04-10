//
//  SettingsView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel : SettingsViewModel = SettingsViewModel()
    @State private var enteredName: String = SettingsViewModel().getSavedName()
    @State private var currentlySelectedEmotion: emotionType = SettingsView.emotionType.angry
    @State private var angrySuggestions: [String] = SettingsViewModel().getSuggestions().AngrySuggestions
    @State private var blehSuggestions: [String] = SettingsViewModel().getSuggestions().BlehSuggestions
    @State private var happySuggestions: [String] = SettingsViewModel().getSuggestions().HappySuggestions
    @State private var sadSuggestions: [String] = SettingsViewModel().getSuggestions().SadSuggestions
    
    enum emotionType: Int {
        case angry = 0
        case bleh = 1
        case happy = 2
        case sad = 3
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
        default:
            print("ERROR: Invalid suggestion type sent to changeSelection function in SettingsView")
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Name: ")
                    .padding()
                TextField("\(viewModel.getSavedName())", text: $enteredName){_ in
                }onCommit:{viewModel.saveUserName(enteredName: enteredName)}
                    .padding()
            }
            TabView{
                TextFieldListView(stringList: angrySuggestions, settingsView: self,emotion: emotionType.angry.rawValue)
                    .tabItem {
                        Image("Icon_Angry")
                        Text("Angry")
                    }
                TextFieldListView(stringList: blehSuggestions, settingsView: self, emotion: emotionType.bleh.rawValue)
                    .tabItem {
                        Image("Icon_Bleh")
                        Text("Bleh")
                    }
                TextFieldListView(stringList: happySuggestions, settingsView: self,emotion: emotionType.happy.rawValue)
                    .tabItem {
                        Image("Icon_Happy")
                        Text("Happy")
                    }
                TextFieldListView(stringList: sadSuggestions, settingsView: self, emotion: emotionType.sad.rawValue)
                    .tabItem {
                        Image("Icon_Sad")
                        Text("Sad")
                    }

            }// Tabview
            .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }//VStack
        .onAppear(){
            currentlySelectedEmotion = emotionType.angry
            let newSuggestions = SettingsViewModel().getSuggestions()
            angrySuggestions = SettingsViewModel().getSuggestions().AngrySuggestions
            blehSuggestions = newSuggestions.BlehSuggestions
            happySuggestions = newSuggestions.HappySuggestions
            sadSuggestions = newSuggestions.SadSuggestions
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
