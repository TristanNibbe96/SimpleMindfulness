//
//  EmotionButtonView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct EmotionButtonView: View {
    @ObservedObject var viewModel = EmotionButtonViewModel()
    @EnvironmentObject var motherViewModel: MotherViewModel
    var emotion : emotionType = .angry
    var emotionText = "Angry"
    var imageName : String = "Face_Angry"
    var radialMenu: RadialMenuButtonView
    
    init(emotion: emotionType, radialMenu: RadialMenuButtonView){
        self.radialMenu = radialMenu
        self.emotion = emotion
        emotionText = viewModel.buttonText(emotion: emotion)
        imageName = viewModel.imageText(emotion: emotion)
    }
    
    
    func logEmotion(){
        viewModel.logEmotion(emotion: emotion)
        motherViewModel.setCurrentEmotion(emotion: emotion)
        radialMenu.toggleRadialMenu()
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
    }

}

struct EmotionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionButtonView(emotion: .angry, radialMenu: RadialMenuButtonView()).environmentObject(MotherViewModel())
    }
}
