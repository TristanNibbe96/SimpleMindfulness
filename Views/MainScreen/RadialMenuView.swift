//
//  RadialMenuView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct RadialMenuView: View {
    var radialMenuButton: RadialMenuButtonView
    
    var scaledWidth: CGFloat{
        return UIScreen.main.bounds.width * 0.25;
    }
    
    func closeRadialMenu(){
        radialMenuButton.closeRadialMenuAndOpenSuggestion(openSuggestion: false)
    }
        
    var body: some View {
        VStack{
            EmotionButtonView(emotion: emotionType.angry, radialMenu: radialMenuButton)
                .frame(width: scaledWidth, height: scaledWidth)
            HStack{
                EmotionButtonView(emotion: emotionType.bleh, radialMenu: radialMenuButton)
                    .frame(width: scaledWidth, height: scaledWidth)
                Spacer()
                Button(action: closeRadialMenu
                ,label: {
                    Image(systemName: "xmark")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                })
                Spacer()
                EmotionButtonView(emotion: emotionType.happy, radialMenu: radialMenuButton)
                    .frame(width: scaledWidth, height: scaledWidth)
                    
            }//end HStack
            EmotionButtonView(emotion: emotionType.sad, radialMenu: radialMenuButton)
                .frame(width: scaledWidth, height: scaledWidth)
        }//EndVStack
        .frame(width:scaledWidth * 3)
        .background(Color.gray)
        .cornerRadius(scaledWidth)
    }
}

struct RadialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuView(radialMenuButton: RadialMenuButtonView(mainView: MainView()))
    }
}
