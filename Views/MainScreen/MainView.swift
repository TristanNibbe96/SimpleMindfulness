//
//  MainView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct MainView: View {
    
    @State var navBarVisible = false
    @State var suggestionScreenVisible = false
    @State var selectedEmotion = emotionType.angry
    
    func changeEmotion(emotion: emotionType){
        selectedEmotion = emotion
    }
    
    func toggleNavBar(){
        navBarVisible.toggle()
    }
    
    func toggleSuggestionScreen(){
        suggestionScreenVisible.toggle()
    }
    
    var scaledWidth: CGFloat{
        return UIScreen.main.bounds.width;
    }
    
    var scaledHeight: CGFloat{
        return UIScreen.main.bounds.height;
    }
    
    var body: some View {
        
        if self.navBarVisible{
            NavBarView(mainView: self)
        }else if self.suggestionScreenVisible{
            SuggestionView(emotion: selectedEmotion, mainView: self)
        }else {
            ContentView(mainView: self)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
