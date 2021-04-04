//
//  SettingsViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/1/21.
//

import Foundation

class SettingsViewModel: ObservableObject{
    
    func saveUserName(enteredName: String){
        UserDefaults.standard.set(enteredName, forKey: "name")
    }
    
    func getSavedName() -> String{
        return UserDefaults.standard.string(forKey: "name") ?? "User Name"
    }
    
    func getPlist(name: String) -> [String]?
    {
        let path = Bundle.main.path(forResource: name, ofType: "plist") ??  ""
        let xml = FileManager.default.contents(atPath:path)
        
        var Plist : [String] = []
        
        if xml != nil {
            return (try? PropertyListSerialization.propertyList(from: xml!, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }
        
        return nil

    }
}
