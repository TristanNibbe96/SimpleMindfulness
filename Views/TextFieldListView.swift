//
//  TextFieldListView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/4/21.
//

import SwiftUI

struct TextFieldListView: View {
    @State var stringList: [String]
    let settingsView: SettingsView
    var emotion: Int = 0
    
    func setStringAtIndex(index: Int, string: String){
        stringList[index] = string
        settingsView.changeSuggestions(suggestionType: SettingsView.emotionType(rawValue: emotion)!, suggestions: stringList)
    }
    
    var body: some View {

        List{
            ForEach(stringList.indices, id: \.self ){ i in
                TextFieldView(text: stringList[i], index: i, fieldList: self)
            }
        }

    }
}

struct TextFieldListView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldListView(stringList: ["String"], settingsView: SettingsView())
    }
}
