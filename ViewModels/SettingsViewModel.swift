//
//  SettingsViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/15/21.
//

import Foundation

class SettingsViewModel: OpeningScreenViewModel{
    func saveUserName(enteredName: String){
        UserDefaults.standard.set(enteredName, forKey: "name")
    }
    
    func getSavedName() -> String{
        return UserDefaults.standard.string(forKey: "name") ?? "User Name"
    }
    
    func getDateLoggingInfo() -> String{
        let privacyPolicy = super.getPrivacyPolicy()
        
        return privacyPolicy[privacyPolicy.count-1]
    }
    
}
