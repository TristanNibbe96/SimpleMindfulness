//
//  TextFieldListView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/4/21.
//

import SwiftUI

struct TextFieldListView: View {
    @State var stringList: [String]
    let editSuggestionsView: EditSuggestionsView
    var emotion = emotionType.angry
    
    func saveSuggestions(){

        editSuggestionsView.saveSuggestions()
    }

    func setStringAtIndex(index: Int, string: String){
        stringList[index] = string
        editSuggestionsView.changeSuggestions(suggestionType: emotion,suggestions: stringList)
    }
    
    func addNewSuggestions(){
        stringList.append("")
        editSuggestionsView.changeSuggestions(suggestionType: emotion, suggestions: stringList)
    }
    
    func deleteSuggestion(){
        if(stringList.count > 0){
            stringList.remove(at: stringList.count-1)
            editSuggestionsView.changeSuggestions(suggestionType: emotion, suggestions: stringList)
        }
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
                    Image(systemName: "plus.square")
                        .font(.title)
                })
                    
                Spacer()
                Button(action: saveSuggestions
                ,label: {
                    Text("Save Changes")
                })
                Spacer()
                
                Button(action: deleteSuggestion
                ,label: {
                    Image(systemName: "minus.square")
                        .font(.title)
                })
                Spacer()
            }.padding()
        }

    }
}

struct TextFieldListView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldListView(stringList: ["String"], editSuggestionsView: EditSuggestionsView())
    }
}
