//
//  SettingsView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel : SettingsViewModel = SettingsViewModel()
    @State var enteredName: String = ""
    @State var angrySuggestions: [String] = ["angry"]
    @State var blehSuggestions: [String] = ["bleh"]
    @State var happySuggestions: [String] = ["happy"]
    @State var sadSuggestions: [String] = ["sad"]
    
    enum emotionType {
        case angry
        case bleh
        case happy
        case sad
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
        let suggestions: Suggestions = viewModel.getProcessedSuggestions(name: "Suggestions")

        VStack{
            Spacer()
            HStack{
                Text("Name: ")
                    .padding()
                TextField("\(viewModel.getSavedName())", text: $enteredName){_ in
                }onCommit:{viewModel.saveUserName(enteredName: enteredName)}
                    .padding()
            }
            TabView{
                TextFieldListView(stringList: suggestions.AngrySuggestions, settingsView: self)
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
        }//VStack
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
