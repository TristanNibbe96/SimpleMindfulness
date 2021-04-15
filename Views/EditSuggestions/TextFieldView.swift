//
//  TextFieldView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/7/21.
//

import SwiftUI

struct TextFieldView: View {
    @State var text: String = "test string"
    var index: Int = 0
    let fieldList: TextFieldListView
    
    func sendChangesToList(){
        fieldList.setStringAtIndex(index: index, string: text)
    }
    
    var body: some View {
        TextField(text, text: $text){_ in
        }onCommit:{sendChangesToList()}
            
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(fieldList: TextFieldListView(stringList: ["test"], editSuggestionsView: EditSuggestionsView()))
    }
}
