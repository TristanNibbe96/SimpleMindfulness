//
//  SettingsViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/1/21.
//

import Foundation

struct SuggestionsRaw: Codable {
    var AngrySuggestions: [String]
    var HappySuggestions: [String]
    var BlehSuggestions: [String]
    var SadSuggestions: [String]
}

struct Suggestions{
    var AngrySuggestions: [String]
    var HappySuggestions: [String]
    var BlehSuggestions: [String]
    var SadSuggestions: [String]
}

class SettingsViewModel: ObservableObject{

    
    func saveUserName(enteredName: String){
        UserDefaults.standard.set(enteredName, forKey: "name")
    }
    
    func getSavedName() -> String{
        return UserDefaults.standard.string(forKey: "name") ?? "User Name"
    }
    
    func getProcessedSuggestions(name: String) -> Suggestions
    {
        let rawSuggestions = getRawSuggestions(enteredName: name)
        var suggestionsProcessed:  Suggestions = Suggestions(AngrySuggestions: [],HappySuggestions: [],BlehSuggestions: [],SadSuggestions: [])
        
        if rawSuggestions != nil{
            suggestionsProcessed.AngrySuggestions = rawSuggestions?.AngrySuggestions ?? ["No Angry Suggestions Detected"]
            suggestionsProcessed.BlehSuggestions = rawSuggestions?.BlehSuggestions ?? ["No Bleh Suggestions Detected"]
            suggestionsProcessed.SadSuggestions = rawSuggestions?.SadSuggestions ?? ["No Sad Suggestions Detected"]
            suggestionsProcessed.HappySuggestions = rawSuggestions?.HappySuggestions ?? ["No Happy Suggestions Detected"]
        }
        
        return suggestionsProcessed
    }
    
    func getRawSuggestions(enteredName: String) -> SuggestionsRaw?{
        let path = Bundle.main.path(forResource: enteredName, ofType: "plist") ??  ""
        let xml = FileManager.default.contents(atPath:path) ?? nil
        var suggestions : SuggestionsRaw? = nil
        if xml != nil{
            do{
                suggestions = try PropertyListDecoder().decode(SuggestionsRaw.self, from: xml!)
            }catch{
                print("\(error)")
            }
        }else{
            print("ERROR: invalid XML path for PList")
        }
        
        return suggestions
    }
    
    
}
