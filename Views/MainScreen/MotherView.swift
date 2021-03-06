//
//  MainView.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/2/21.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewModel : MotherViewModel
    
    var body: some View {
        switch viewModel.currentScreen {
            case .privacyPolicy:
                PrivacyPolicyView()
            case .navbar:
                NavBarView()
            case .suggestion:
                SuggestionView(suggestionType: viewModel.currentEmotion)
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
