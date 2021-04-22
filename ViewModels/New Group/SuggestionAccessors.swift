//
//  SuggestionAccessors.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/15/21.
//

import Foundation

enum emotionType: Int {
     case angry = 0
     case bleh = 1
     case happy = 2
     case sad = 3
    
}

class SuggestionAccessors: ObservableObject{

    private var plistURL: URL{
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent("Suggestions.plist")
    }
    
    @Published var angrySuggestions: [String] = []
    @Published var blehSuggestions: [String] = []
    @Published var happySuggestions: [String] = []
    @Published var sadSuggestions: [String] = []

    
    init(){
        let suggestions = getSuggestions()
        
        angrySuggestions = suggestions.AngrySuggestions
        blehSuggestions = suggestions.BlehSuggestions
        happySuggestions = suggestions.HappySuggestions
        sadSuggestions = suggestions.SadSuggestions
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
        
        if let data = try? encoder.encode(suggestions){
            if FileManager.default.fileExists(atPath: plistURL.path){
                try? data.write(to: plistURL)
            }else{
                FileManager.default.createFile(atPath: plistURL.path, contents: data, attributes: nil)
            }
        }
    }
    
    
    func getSuggestions() -> Suggestions{
        let decoder = PropertyListDecoder()
        
        guard let data = try? Data.init(contentsOf: plistURL),
              let suggestions = try? decoder.decode(Suggestions.self, from: data)
        else{
            //TODO sett to get and return a default value
            return getDefaultSuggestionValuesFromBundle()
        }
        
        return suggestions
    }
    
    func getDefaultSuggestionValuesFromBundle() -> Suggestions{
        let path = Bundle.main.path(forResource: "Suggestions", ofType:  "plist")
        let data = FileManager.default.contents(atPath: path!)
        let decoder = PropertyListDecoder()
        
        let rawSuggestions = try! decoder.decode(Suggestions.self, from: data!)
        
        return rawSuggestions
    }
    
    func getSuggestionList(emotion: emotionType)-> [String]{
        var suggestionList = ["1","2"]
        
        switch emotion {
        case emotionType.angry:
            suggestionList = angrySuggestions
        case emotionType.bleh:
            suggestionList = blehSuggestions
        case emotionType.happy:
            suggestionList = happySuggestions
        case emotionType.sad:
            suggestionList = sadSuggestions
        }
        
        return suggestionList
    }
}

