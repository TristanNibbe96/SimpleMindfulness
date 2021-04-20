//
//  MainView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct MainView: View {
    let viewModel = MainViewModel()
    @State var navBarVisible = false
    @State var suggestionScreenVisible = false
    @State var selectedEmotion = emotionType.angry
    @State var seenPrivacyPolicy = MainViewModel().getAcceptedPrivacyPolicy()
    
    func closeOpeningScreen(accepted: Bool){
        seenPrivacyPolicy = true
        viewModel.setAcceptedPrivacyPolicy(acceptedDateLogging: accepted)
    }
    
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
        if !seenPrivacyPolicy{
            OpeningScreenView(mainView: self)
        }else if self.navBarVisible{
            NavBarView(mainView: self)
        }else if self.suggestionScreenVisible{
            SuggestionView(mainView: self, suggestionType: selectedEmotion, screenVisible: $suggestionScreenVisible)
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
