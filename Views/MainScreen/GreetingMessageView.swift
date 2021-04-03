//
//  GreetingMessageView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct GreetingMessageView: View {
    @ObservedObject var viewModel : ContentViewModel = ContentViewModel()
    
    var scaledWidth: String{
        return viewModel.getSavedName()
    }
    
    var body: some View {
        Text("Hello, \(viewModel.getSavedName()) how are you today?")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: 300)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(25)
    }
}

struct GreetingMessageView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingMessageView()
    }
}
