//
//  SuggestionView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/10/21.
//

import SwiftUI

struct SuggestionView: View {
    @State var emotion = emotionType.angry
    var mainView: MainView
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(
                    action: mainView.toggleSuggestionScreen
                ,label: {
                    Image(systemName: "return")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                })
                    .padding(.trailing)
            }
            
            Spacer()
            Text("Hello, World!")
            Spacer()
        }
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(mainView: MainView())
    }
}
