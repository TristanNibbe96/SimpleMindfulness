//
//  MainViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/11/21.
//

import Foundation

class MainViewModel: SuggestionAccessors{
    
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

