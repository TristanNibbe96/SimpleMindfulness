//
//  GreetingMessageView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/1/21.
//

import SwiftUI

struct GreetingMessageView: View {
    var body: some View {
        Text("Hello, _name_ how are you today?")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: 300)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(25)
    }
}

struct GreetingMessageView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingMessageView()
    }
}
