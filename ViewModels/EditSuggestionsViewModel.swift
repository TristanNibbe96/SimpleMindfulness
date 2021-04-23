//
//  SettingsViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/1/21.
//

import Foundation


class EditSuggestionsViewModel: SuggestionAccessors{
    
    func appendSuggestion(emotion: emotionType, suggestion: String){
        switch emotion {
            case .angry:
                angrySuggestions.append(suggestion)
            case .bleh:
                blehSuggestions.append(suggestion)
            case .happy:
                happySuggestions.append(suggestion)
            case .sad:
                sadSuggestions.append(suggestion)
        }
        saveSuggestions()
    }
    
    func deleteSuggestion(emotion: emotionType, at offsets: IndexSet){
        switch emotion {
            case .angry:
                angrySuggestions.remove(atOffsets: offsets)
            case .bleh:
                blehSuggestions.remove(atOffsets: offsets)
            case .happy:
                happySuggestions.remove(atOffsets: offsets)
            case .sad:
                sadSuggestions.remove(atOffsets: offsets)
        }
        saveSuggestions()
    }
    
}
