//
//  TextFieldListView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/4/21.
//

import SwiftUI

struct TextFieldListView: View {
    var stringList: [String]
    
    var body: some View {

        List{
            ForEach(stringList, id: \.self ){ string in
                TextFieldView(text: string)
            }
        }

    }
}

struct TextFieldListView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldListView(stringList: ["String"])
    }
}
