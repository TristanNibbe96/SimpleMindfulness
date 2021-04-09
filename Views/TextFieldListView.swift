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
    
    func addNewSuggestions(){
        stringList.append("")
    }
    
    func deleteSuggestion(){
        stringList.remove(at: stringList.count-1)
    }
    
    var body: some View {
        VStack{
            List{
                ForEach(stringList.indices, id: \.self ){ i in
                    TextFieldView(text: stringList[i], index: i, fieldList: self)
                }
            }
            HStack{
                Spacer()
                Button(action: addNewSuggestions
                ,label: {
                    Image(systemName: "plus")
                })
                    
                Spacer()
                Button(action: deleteSuggestion
                ,label: {
                    Image(systemName: "minus")
                })
                Spacer()
            }
        }

    }
}

struct TextFieldListView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldListView(stringList: ["String"], settingsView: SettingsView())
    }
}
