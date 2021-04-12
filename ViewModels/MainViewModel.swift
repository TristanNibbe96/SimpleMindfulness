//
//  MainViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by user192295 on 4/11/21.
//

import Foundation

class MainViewModel: SettingsViewModel{
    
    
    func getSuggestionListFromSaved(emotion: emotionType)-> [String]{
        var suggestionList = ["1","2"]
        
        switch emotion {
        case emotionType.angry:
            suggestionList = super.getSuggestions().AngrySuggestions
        case emotionType.bleh:
            suggestionList = super.getSuggestions().BlehSuggestions
        case emotionType.happy:
            suggestionList = super.getSuggestions().HappySuggestions
        case emotionType.sad:
            suggestionList = super.getSuggestions().SadSuggestions
        }
        
        return suggestionList
    }
}

