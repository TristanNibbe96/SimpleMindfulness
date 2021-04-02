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
            TextField("\(viewModel.getSavedName())", text: $enteredName){_ in
            }onCommit:{viewModel.saveUserName(enteredName: enteredName)}
        }
        .frame(width: 100)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
