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
                        VStack{
                            Text("Happy")
                                .font(.title)
                                Image("Face_Happy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                        }
                    }
            )//EndButton
    }
}

struct EmotionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionButtonView()
    }
}
