//
//  RadialMenuView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/1/21.
//

import SwiftUI

struct RadialMenuView: View {
    func logEmotion(){
        
    }
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
            EmotionButtonView()
                Spacer()
            }
            HStack{
                EmotionButtonView()
                EmotionButtonView()
            }//end HStack
            EmotionButtonView()
            Spacer()
        }//EndVStack
    }
}

struct RadialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuView()
    }
}
