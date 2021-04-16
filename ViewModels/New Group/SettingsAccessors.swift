//
//  SettingsAccessors.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/15/21.
//

import Foundation

class SettingsAccessors: ObservableObject{
    func saveUserName(enteredName: String){
        UserDefaults.standard.set(enteredName, forKey: "name")
    }
    
    func getSavedName() -> String{
        return UserDefaults.standard.string(forKey: "name") ?? "User Name"
    }
    

    
    func getPrivacyPolicy() -> [String]{
        var fileContent = ""
        if let filepath = Bundle.main.path(forResource: "PrivacyPolicy", ofType: "txt"){
            do{
                fileContent = try String(contentsOfFile: filepath)
            }catch{
                fileContent = "content could not be loaded"
            }
        }else{
            fileContent = "PrivacyPolicy.txt not found"
        }
        
        return fileContent.components(separatedBy: "----")
    }
}
