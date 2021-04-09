//
//  SettingsView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel : SettingsViewModel = SettingsViewModel()
    @State private var enteredName: String = ""
    @State private var currentlySelectedEmotion: emotionType = SettingsView.emotionType.angry
    @State private var angrySuggestions: [String] = ["angry"]
    @State private var blehSuggestions: [String] = ["bleh"]
    @State private var happySuggestions: [String] = ["happy"]
    @State private var sadSuggestions: [String] = ["sad"]
    
    enum emotionType: Int {
        case angry = 0
        case bleh = 1
        case happy = 2
        case sad = 3
    }
    
    func deleteSuggestion(){
        
    }
    
    func addNewSuggestions(){
        angrySuggestions.append("")
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
        let suggestions: Suggestions = viewModel.getSuggestions()

        VStack{
            HStack{
                Text("Name: ")
                    .padding()
                TextField("\(viewModel.getSavedName())", text: $enteredName){_ in
                }onCommit:{viewModel.saveUserName(enteredName: enteredName)}
                    .padding()
            }
            TabView{
                TextFieldListView(stringList: angrySuggestions, settingsView: self)
                    .tabItem {
                        Image("Icon_Angry")
                        Text("Angry")
                    }
                TextFieldListView(stringList: suggestions.HappySuggestions, settingsView: self)
                    .tabItem {
                        Image("Icon_Happy")
                        Text("Happy")
                    }
                TextFieldListView(stringList: suggestions.SadSuggestions, settingsView: self)
                    .tabItem {
                        Image("Icon_Sad")
                        Text("Sad")
                    }
                TextFieldListView(stringList: suggestions.BlehSuggestions, settingsView: self)
                    .tabItem {
                        Image("Icon_Bleh")
                        Text("Bleh")
                    }
            }// Tabview
            .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            Spacer()
            
            HStack{

                Spacer()
                
                Button(action: saveSuggestions
                ,label: {
                    Text("Save Changes")
                })
                Spacer()

            }
        }//VStack
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
