//
//  SuggestionViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/15/21.
//

import Foundation
import SwiftUI

class SuggestionViewModel: SuggestionAccessors{

    func getBackgroundColor(suggestionType: emotionType) -> Color{
        var background: Color = .blue
        
        switch suggestionType {
            case .angry:
                background = .blue
            case .bleh:
                background = .purple
            case .happy:
                background = .white
            case .sad:
                background = .orange
        }
        return background
    }
    
    func getSaturationLevel(suggestionType: emotionType) -> Double{
        var saturation: Double = 1.0
        
        switch suggestionType {
            case .angry:
                saturation = 2.0
            case .bleh:
                saturation = 2.0
            case .happy:
                saturation = 1.0
            case .sad:
                saturation = 1.5
        }
        
        return saturation
    }
}

