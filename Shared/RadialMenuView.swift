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
            EmotionButtonView()
                .frame(width: 100.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)

            HStack{
                EmotionButtonView()
                    .frame(width: 100.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                EmotionButtonView()
                    .frame(width: 100.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            }//end HStack
            EmotionButtonView()
                .frame(width: 100.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
        }//EndVStack
    }
}

struct RadialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        RadialMenuView()
    }
}
