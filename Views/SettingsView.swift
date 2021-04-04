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
                StringListView(stringList: suggestions.AngrySuggestions)
                    .tabItem {
                        Image(systemName: "house")
                    }
                StringListView(stringList: suggestions.HappySuggestions)
                    .tabItem {
                        Image(systemName: "house")
                    }
                StringListView(stringList: suggestions.SadSuggestions)
                    .tabItem {
                        Image(systemName: "house")
                    }
                StringListView(stringList: suggestions.BlehSuggestions)
                    .tabItem {
                        Image(systemName: "house")
                    }
            }// Tabview
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            Spacer()
        }//VStack
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
