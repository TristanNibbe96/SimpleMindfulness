//
//  LogEntryViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/28/21.
//

import Foundation

class LogEntryViewModel{
    
    func emotionText(emotionRaw: Int16) -> String{
        var emotionText = ""
        let emotion: emotionType = emotionType(rawValue: Int(emotionRaw))!
        
        switch emotion {
        case emotionType.angry:
            emotionText = "Angry"
        case emotionType.bleh:
            emotionText = "Bleh"
        case emotionType.happy:
            emotionText = "Happy"
        case emotionType.sad:
            emotionText = "Sad"
        }
        return emotionText
        
    }
    
    func getFormattedDateTime(date: Date) -> String{        
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.timeStyle = .short
        
        let dateTime = formater.string(from: date)
        return dateTime
    }
}
