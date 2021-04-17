//
//  NextSuggestionButtonView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/16/21.
//

import SwiftUI

struct NextSuggestionButtonView: View {
    let item: () -> Void
    
    var body: some View {
        Button(action: item
        ,label: {
            ZStack{
                
            Text("Show another suggestion")
                .foregroundColor(.black)
            }
        })
        .padding()
        .background(Color.gray)
            .cornerRadius(20)
    }
}

struct NextSuggestionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextSuggestionButtonView(item: misc)
    }
    
    static func misc() -> Void{
        
    }
}
