//
//  MainView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct MotherView: View {
    @ObservedObject var viewModel = MotherViewModel()
    @State var navBarVisible = false
    @State var suggestionScreenVisible = false
    @State var selectedEmotion = emotionType.angry
    
    func closeOpeningScreen(accepted: Bool){
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
    
    var body: some View {
        
        switch viewModel.currentScreen {
            case .privacyPolicy:
                PrivacyPolicyView(motherView: self)
            case .navbar:
                NavBarView(motherView: self)
            case .suggestion:
                SuggestionView(motherView: self)
            case .main:
                MainView(motherView: self)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
