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
    @State var showingPrivacyPolicy = false
    
    let dataLoggingInfo = SettingsViewModel().getDateLoggingInfo()
    let privacyPolicy = SettingsViewModel().getPrivacyPolicy()
    
    func showPrivacyPolicy(){
        showingPrivacyPolicy.toggle()
    }


    var body: some View {
        VStack{
            HStack{
                Text("Name: ")
                TextField("\(viewModel.getSavedName())", text: $enteredName){_ in
                }onCommit:{viewModel.saveUserName(enteredName: enteredName)}
            }.padding(.top)
            
            Divider().padding()
            
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
                    Alert(title: Text("Title"), message: Text(dataLoggingInfo), dismissButton: .default(Text("Close")))
                })
            }//HStack
            
            Divider().padding()
            
            Button(action: showPrivacyPolicy,
            label: {
                Text("Privacy Policy")
            })
            .sheet(isPresented: $showingPrivacyPolicy){
                VStack{
                    Text(privacyPolicy[0])
                        .padding()
                    Spacer()
                }
            }//Sheet
            
            Spacer()
        }//VStack
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
