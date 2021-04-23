//
//  OpeningScreen.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/12/21.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @EnvironmentObject var motherViewModel : MotherViewModel
    @State private var accepted = false
    let privacyPolicy = PrivacyPolicyViewModel().getPrivacyPolicy()
    
    func acceptPrivacyPolicy(){
        motherViewModel.setCurrentScreen(screen: screenType.main)
    }
    
    var body: some View {
        NavigationView{
            List{
                Text(privacyPolicy[0])
                    .multilineTextAlignment(.center)
                HStack{
                    Toggle(isOn: $accepted
                    ,label: {
                        Text(privacyPolicy[1])
                            .multilineTextAlignment(.center)
                    })
                }
                Button(action: acceptPrivacyPolicy
                ,label: {
                    HStack{
                        Spacer()
                        Text("I have read and acknowledged this policy")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                })
            }
            .navigationBarTitle("Privacy Policy", displayMode: .inline)
        }
    }
}

struct OpeningScreen_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView().environmentObject(MotherViewModel())
    }
}
