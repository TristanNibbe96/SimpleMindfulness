//
//  RadialMenuView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct RadialMenuView: View {
    var radialMenu: RadialMenuButtonView
    var scaledWidth: CGFloat{
        return UIScreen.main.bounds.width * 0.25;
    }
        
    var body: some View {
        VStack{
            EmotionButtonView(emotion: emotionType.angry, radialMenu: radialMenu)
                .frame(width: scaledWidth, height: scaledWidth)
            HStack{
                EmotionButtonView(emotion: emotionType.bleh, radialMenu: radialMenu)
                    .frame(width: scaledWidth, height: scaledWidth)
                Spacer()
                EmotionButtonView(emotion: emotionType.happy, radialMenu: radialMenu)
                    .frame(width: scaledWidth, height: scaledWidth)
                    
            }//end HStack
            EmotionButtonView(emotion: emotionType.sad, radialMenu: radialMenu)
                .frame(width: scaledWidth, height: scaledWidth)
        }//EndVStack
        .frame(width:scaledWidth * 3)
        .background(Color.gray)
        .cornerRadius(scaledWidth)
    }
}

struct RadialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuView(radialMenu: RadialMenuButtonView(mainView: MainView()))
    }
}
