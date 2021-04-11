//
//  RadialMenuView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct RadialMenuView: View {
    var scaledWidth: CGFloat{
        return UIScreen.main.bounds.width * 0.25;
    }
        
    var body: some View {
        VStack{
            EmotionButtonView(emotion: emotionType.angry)
                .frame(width: scaledWidth, height: scaledWidth)
            HStack{
                EmotionButtonView(emotion: emotionType.bleh)
                    .frame(width: scaledWidth, height: scaledWidth)
                Spacer()
                EmotionButtonView(emotion: emotionType.happy)
                    .frame(width: scaledWidth, height: scaledWidth)
                    
            }//end HStack
            EmotionButtonView(emotion: emotionType.sad)
                .frame(width: scaledWidth, height: scaledWidth)
        }//EndVStack
        .frame(width:scaledWidth * 3)
        .background(Color.gray)
        .cornerRadius(scaledWidth)
    }
}

struct RadialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuView()
    }
}
