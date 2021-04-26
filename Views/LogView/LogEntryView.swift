//
//  LogEntryView.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/26/21.
//

import SwiftUI

struct LogEntryView: View {
    let emotion: String
    
    var body: some View {
        Text(emotion)
    }
}

struct LogEntryView_Previews: PreviewProvider {
    static var previews: some View {
        LogEntryView(emotion: "test")
    }
}
