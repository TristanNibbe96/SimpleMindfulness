//
//  SettingsViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/15/21.
//

import Foundation

class SettingsViewModel: OpeningScreenViewModel{

    func getDateLoggingInfo() -> String{
        let privacyPolicy = getPrivacyPolicy()
        
        return privacyPolicy[privacyPolicy.count-1]
    }
    
}
