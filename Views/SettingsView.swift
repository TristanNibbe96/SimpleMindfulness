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
        VStack{
            HStack{
                Text("Name: ")
                    .padding()
                TextField("\(viewModel.getSavedName())", text: $enteredName){_ in
                }onCommit:{viewModel.saveUserName(enteredName: enteredName)}
                    .padding()
            }
            List{
                ForEach(viewModel.getProcessedSuggestions(name: "Suggestions").AngrySuggestions, id: \.self ){ action in
                    Text(action)
                }
            }
        }.padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
