//
//  SuggestionTextView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/16/21.
//

import SwiftUI

struct SuggestionTextView: View {
    let suggestion: String
    var backgroundColor: Color
    
    init(backgroundColor: Color = Color.red, suggestion: String = "Test String"){
        self.suggestion = suggestion
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Text(suggestion)
            .padding()
            .background(backgroundColor.opacity(0.60))
            .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(backgroundColor.opacity(1.0), lineWidth: 7.0)
            )
            .cornerRadius(15)
    }
}

struct SuggestionTextView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionTextView()
    }
}
