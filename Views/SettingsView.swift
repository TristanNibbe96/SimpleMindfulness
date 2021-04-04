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
                        Image("Face_Angry")
                            .frame(width: 10, height: 10)
                    }
                StringListView(stringList: suggestions.HappySuggestions)
                    .tabItem {
                        Image(systemName: "face.smiling")
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
