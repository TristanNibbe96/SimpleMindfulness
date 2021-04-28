//
//  LogEntryView.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/26/21.
//

import SwiftUI

struct LogEntryView: View {
    let entry: LoggedEmotion
    let viewModel: LogEntryViewModel = LogEntryViewModel()
    let emotionText: String
    let dateTime: Date
    let dateString: String
    
    init(entry: LoggedEmotion) {
        self.entry = entry
        emotionText = viewModel.emotionText(emotionRaw: entry.emotionType)
        dateTime = entry.dateTime ?? Date()
        dateString = viewModel.getFormattedDateTime(date: dateTime)
    }
    
    var body: some View {
        HStack{
            Text(emotionText)
            Text(dateString)
        }
    }
}

struct LogEntryView_Previews: PreviewProvider {
    
    static func test() -> LoggedEmotion{
        let emotion = LoggedEmotion()
        
        emotion.dateTime = Date()
        emotion.emotionType = 0
        
        return emotion
    }
    static var previews: some View {
        LogEntryView(entry: test())
    }
}
