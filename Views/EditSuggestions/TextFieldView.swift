//
//  TextFieldView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/7/21.
//

import SwiftUI

struct TextFieldView: View {
    @State var text: String = "test string"
    
    var body: some View {
        TextField(text, text: $text)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
