//
//  EditSuggestionsView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI


struct EditSuggestionsView: View {
    @ObservedObject var viewModel : EditSuggestionsViewModel = EditSuggestionsViewModel()
    @State private var currentlySelectedEmotion = emotionType.angry


    var body: some View {
        VStack{
            TabView{
                TextFieldListView(emotion: emotionType.angry, viewModel: viewModel)
                    .tabItem {
                        Image("Icon_Angry")
                        Text("Angry")
                    }
                TextFieldListView(emotion: emotionType.bleh, viewModel: viewModel)
                    .tabItem {
                        Image("Icon_Bleh")
                        Text("Bleh")
                    }
                TextFieldListView(emotion: emotionType.happy, viewModel: viewModel)
                    .tabItem {
                        Image("Icon_Happy")
                        Text("Happy")
                    }
                TextFieldListView(emotion: emotionType.sad,viewModel: viewModel)
                    .tabItem {
                        Image("Icon_Sad")
                        Text("Sad")
                    }

            }// Tabview
        }//VStack
    }
}

struct EditSuggestionsView_Preview: PreviewProvider {
    static var previews: some View {
        EditSuggestionsView()
    }
}
