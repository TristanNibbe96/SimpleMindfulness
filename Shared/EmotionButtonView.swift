//
//  EmotionButtonView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/1/21.
//

import SwiftUI

struct EmotionButtonView: View {
    func logEmotion(){
        
    }
    
    var body: some View {
        Button(action: {self.logEmotion()}
               ,label: {
                    ZStack{
                        Text("Happy")
                        Image("Face_Happy")
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
