//
//  StringListView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/4/21.
//

import SwiftUI

struct StringListView: View {
    
    var stringList: [String]
    
    var body: some View {
        List{
            ForEach(stringList, id: \.self ){ action in
                Text(action)
            }
        }

    }
}

struct StringListView_Previews: PreviewProvider {
    static var previews: some View {
        StringListView(stringList: ["String"])
    }
}
