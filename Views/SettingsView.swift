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
                TextFieldListView(stringList: suggestions.AngrySuggestions)
                    .tabItem {
                        Image("Icon_Angry")
                        Text("Angry")
                    }
                TextFieldListView(stringList: suggestions.HappySuggestions)
                    .tabItem {
                        Image("Icon_Happy")
                        Text("Happy")
                    }
                TextFieldListView(stringList: suggestions.SadSuggestions)
                    .tabItem {
                        Image("Icon_Sad")
                        Text("Sad")
                    }
                TextFieldListView(stringList: suggestions.BlehSuggestions)
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
