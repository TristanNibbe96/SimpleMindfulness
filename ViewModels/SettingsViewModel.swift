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
    var AngrySuggestions: [String] = []
    var HappySuggestions: [String] = []
    var BlehSuggestions: [String] = []
    var SadSuggestions: [String] = []
}

class SettingsViewModel: ObservableObject{
    
    
    func saveUserName(enteredName: String){
        UserDefaults.standard.set(enteredName, forKey: "name")
    }
    
    func getSavedName() -> String{
        return UserDefaults.standard.string(forKey: "name") ?? "User Name"
    }
    
    func packageSuggestionArraysIntoObject(angry: [String], bleh: [String], happy: [String], sad: [String]) -> Suggestions{
        var suggestions = Suggestions()
        suggestions.AngrySuggestions = angry
        suggestions.BlehSuggestions = bleh
        suggestions.HappySuggestions = happy
        suggestions.SadSuggestions = sad
        
        return suggestions
    }
        
    func saveSuggestions(angry: [String], bleh: [String], happy: [String], sad: [String], name: String){
        let suggestions = packageSuggestionArraysIntoObject(angry: angry, bleh: bleh, happy: happy, sad: sad)
        let encoder =  PropertyListEncoder()
        encoder.outputFormat = .xml
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name + ".plist")
        //let path = Bundle.main.path(forResource: name, ofType: "plist") ??  ""
        //let url = URL(string: path)

        let suggestionsRaw = processedToRawSuggestionConversion(suggestions: suggestions, name: name)
        
        do{
            let data = try encoder.encode(suggestionsRaw)
            try data.write(to: path)
        }catch{
            print(error)
        }
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
        
    func processedToRawSuggestionConversion(suggestions: Suggestions, name: String) -> SuggestionsRaw{
        var rawSuggestions = getRawSuggestions(enteredName: name)!
        
        rawSuggestions.AngrySuggestions = suggestions.AngrySuggestions
        rawSuggestions.BlehSuggestions = suggestions.BlehSuggestions
        rawSuggestions.HappySuggestions = suggestions.HappySuggestions
        rawSuggestions.SadSuggestions = suggestions.SadSuggestions
        
        return rawSuggestions
    }
    
    
}
