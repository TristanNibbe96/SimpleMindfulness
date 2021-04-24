//
//  MainView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewModel : MotherViewModel
    @State var selectedEmotion = emotionType.angry
    
    
    var body: some View {
        switch viewModel.currentScreen {
            case .privacyPolicy:
                PrivacyPolicyView(motherView: self)
            case .navbar:
                NavBarView()
            case .suggestion:
                SuggestionView(motherView: self)
            case .main:
                MainView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(MotherViewModel())
    }
}
