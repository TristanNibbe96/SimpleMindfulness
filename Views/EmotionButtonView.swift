//
//  EmotionButtonView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct EmotionButtonView: View {
    func logEmotion(){
        
    }
    
    var body: some View {
        Button(action: {self.logEmotion()}
            ,label: {
                VStack(alignment: .center, spacing: 0, content: {
                    Text("Happy")
                        .font(.title)
                        .foregroundColor(Color.red)
                    Image("Face_Happy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })//End Vstack
            }
        )//End Button
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct EmotionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionButtonView()
    }
}
