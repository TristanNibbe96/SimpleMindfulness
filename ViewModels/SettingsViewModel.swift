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
    private var plistURL: URL{
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent("Suggestions.plist")
    }
    
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
        let suggestionsRaw = processedToRawSuggestionConversion(suggestions: suggestions, name: name)
        
        if let data = try? encoder.encode(suggestionsRaw){
            if FileManager.default.fileExists(atPath: plistURL.path){
                try? data.write(to: plistURL)
            }else{
                FileManager.default.createFile(atPath: plistURL.path, contents: data, attributes: nil)
            }
        }
    }
    
    func getProcessedSuggestions(name: String) -> Suggestions
    {
        let rawSuggestions = getRawSuggestions(enteredName: name)
        var suggestionsProcessed:  Suggestions = Suggestions(AngrySuggestions: [],HappySuggestions: [],BlehSuggestions: [],SadSuggestions: [])
        
        
        suggestionsProcessed.AngrySuggestions = rawSuggestions.AngrySuggestions
        suggestionsProcessed.BlehSuggestions = rawSuggestions.BlehSuggestions
        suggestionsProcessed.SadSuggestions = rawSuggestions.SadSuggestions
        suggestionsProcessed.HappySuggestions = rawSuggestions.HappySuggestions
        
        return suggestionsProcessed
    }
    
    func getRawSuggestions(enteredName: String) -> SuggestionsRaw{
        let decoder = PropertyListDecoder()
        
        guard let data = try? Data.init(contentsOf: plistURL),
              let suggestionsRaw = try? decoder.decode(SuggestionsRaw.self, from: data)
        else{
            //TODO sett to get and return a default value
            return getDefaultValuesFromBundle()
        }
        
        return suggestionsRaw
        
    }
    
    func getDefaultValuesFromBundle() -> SuggestionsRaw{
        let path = Bundle.main.path(forResource: "Suggestions", ofType:  "plist")
        let data = FileManager.default.contents(atPath: path!)
        let decoder = PropertyListDecoder()
        
        let rawSuggestions = try! decoder.decode(SuggestionsRaw.self, from: data!)
        
        return rawSuggestions
    }
        
    func processedToRawSuggestionConversion(suggestions: Suggestions, name: String) -> SuggestionsRaw{
        var rawSuggestions = getRawSuggestions(enteredName: name)
        
        rawSuggestions.AngrySuggestions = suggestions.AngrySuggestions
        rawSuggestions.BlehSuggestions = suggestions.BlehSuggestions
        rawSuggestions.HappySuggestions = suggestions.HappySuggestions
        rawSuggestions.SadSuggestions = suggestions.SadSuggestions
        
        return rawSuggestions
    }
    
    
}
