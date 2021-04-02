//
//  SettingsView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct SettingsView: View {
    @State var enteredName: String = ""
    
    @State var savedName = UserDefaults.standard.string(forKey: "name") ?? ""
    
    func saveName(){
        UserDefaults.standard.set(enteredName, forKey: "name")
        savedName = enteredName
    }
    
    var body: some View {
        VStack{
            TextField("\(savedName)", text: $enteredName){_ in
            }onCommit:{saveName()}
        }
        .frame(width: 100)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
