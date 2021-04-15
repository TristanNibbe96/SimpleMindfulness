//
//  SettingsView.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/14/21.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel : SettingsViewModel = SettingsViewModel()
    @State private var enteredName: String = SettingsViewModel().getSavedName()
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
        }//VStack
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
