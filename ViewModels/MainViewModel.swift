//
//  MainViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/11/21.
//

import Foundation

class MainViewModel: EditSuggestionsViewModel{
    
    
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
    
    func getAcceptedPrivacyPolicy() -> Bool{
        var seen = false
        
        seen = UserDefaults.standard.bool(forKey: "acceptedPrivacyPolicy")

        return seen
    }
    
    func setAcceptedPrivacyPolicy(acceptedDateLogging: Bool){
        UserDefaults.standard.set(acceptedDateLogging, forKey: "acceptedDateLogging")
        UserDefaults.standard.set(true, forKey: "acceptedPrivacyPolicy")
    }
}

