//
//  LogView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct LogView: View {
    @ObservedObject var viewModel = LogViewModel()
    
    let log = LogViewModel().loadLoggedEmotions()
    
    var body: some View {
        VStack{
            ForEach(log, id: \.self ){ logEntry in
                LogEntryView(entry: logEntry)
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
