//
//  MainViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/11/21.
//

import Foundation

enum screenType: Int {
     case privacyPolicy = 0
     case main = 1
     case navbar = 2
     case suggestion = 3
}

class MotherViewModel: SuggestionAccessors{
    @Published var acceptedPrivacyPolicy: Bool = false
    @Published var currentScreen: screenType = screenType.privacyPolicy
    
    func setCurrentScreen(screen: screenType){
        currentScreen = screen
    }
    
    override init(){
        super.init()
        acceptedPrivacyPolicy = getAcceptedPrivacyPolicy()
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

