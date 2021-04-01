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
        GeometryReader { geo in
            Button(action: {self.logEmotion()}
                   ,label: {
                        VStack{
                            Text("Happy")
                                .font(.title)
                            GeometryReader { geo2 in
                                Image("Face_Happy")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
            )//EndButton
            .background(Color.red)
        }
    }
}

struct EmotionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionButtonView()
    }
}
