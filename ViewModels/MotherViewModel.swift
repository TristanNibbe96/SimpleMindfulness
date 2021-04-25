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

class MotherViewModel: ObservableObject{
    @Published var acceptedPrivacyPolicy: Bool = false
    @Published var currentScreen: screenType = screenType.privacyPolicy
    @Published var currentEmotion: emotionType = .angry
    
    func setCurrentEmotion(emotion: emotionType){
        currentEmotion = emotion;
    }
    
    func setCurrentScreen(screen: screenType){
        currentScreen = screen
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

