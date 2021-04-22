//
//  TextFieldListView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/4/21.
//

import SwiftUI

struct TextFieldListView: View {
    var emotion = emotionType.angry
    var viewModel: EditSuggestionsViewModel
 
    
    func delete(offsets: IndexSet){
        viewModel.deleteSuggestion(emotion:emotion, at: offsets)
    }
    
    func addNewSuggestion(){
        
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
                Spacer()
                Button(action: addNewSuggestion
                ,label: {
                    Image(systemName: "plus.square")
                        .font(.title)
                })
                    
                

            }.padding()
        }

    }
}

struct TextFieldListView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldListView(viewModel: EditSuggestionsViewModel())
    }
}
