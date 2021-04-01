//
//  RadialMenuView.swift
//  SimpleMindfulness
//
//  Created by user192295 on 4/1/21.
//

import SwiftUI

struct RadialMenuView: View {
    func logEmotion(){
        
    }
    
    var body: some View {
        VStack{
            EmotionButtonView()
            HStack{
                EmotionButtonView()
                EmotionButtonView()
            }//end HStack
            EmotionButtonView()
        }//EndVStack
    }
}

struct RadialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuView()
    }
}
