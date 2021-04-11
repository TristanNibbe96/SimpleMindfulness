//
//  EmotionButtonView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct EmotionButtonView: View {
    @ObservedObject var viewModel = EmotionButtonViewModel()
    @State var emotion = emotionType.angry
    @State var emotionText = "Happy"
    @State var imageName = "Face_Happy"
    
    func logEmotion(){
        
    }
    
    func setImageAndText(){
        emotionText = viewModel.buttonText(emotion: emotion)
        imageName = viewModel.imageText(emotion: emotion)
    }
    
    var body: some View {
        Button(action: {self.logEmotion()}
            ,label: {
                VStack(alignment: .center, spacing: 0, content: {
                    Text(emotionText)
                        .font(.title)
                        .foregroundColor(Color.red)
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })//End Vstack
            }
        )//End Button
        .background(Color.white)
        .cornerRadius(20)
        .onAppear(){
            setImageAndText()
        }
    }

}

struct EmotionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionButtonView()
    }
}
