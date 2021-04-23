//
//  TextFieldListView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/4/21.
//

import SwiftUI

struct TextFieldListView: View {
    @State var newSuggestion: String = ""
    var emotion = emotionType.angry
    @ObservedObject var viewModel: EditSuggestionsViewModel
 
    
    func delete(offsets: IndexSet){
        viewModel.deleteSuggestion(emotion:emotion, at: offsets)
    }
    
    func addNewSuggestion(){
        viewModel.appendSuggestion(emotion: emotion, suggestion: newSuggestion)
        newSuggestion = ""
    }
    
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.getSuggestionList(emotion: emotion), id: \.self ){ suggestion in
                    TextFieldView(text: suggestion)
                }
                .onDelete(perform: delete)
            }
            HStack{
                TextField("Enter New Suggestion Here", text: $newSuggestion)
                Spacer()
                Button(action: addNewSuggestion
                ,label: {
                    Image(systemName: "plus.square")
                        .font(.title)
                })
                .disabled(newSuggestion.isEmpty)
            }.padding()
        }

    }
}

struct TextFieldListView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldListView(viewModel: EditSuggestionsViewModel())
    }
}
