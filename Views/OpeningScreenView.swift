//
//  OpeningScreen.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/12/21.
//

import SwiftUI

struct OpeningScreenView: View {
    @State private var status = false
    
    var body: some View {
        VStack{
            HStack{
                Toggle(isOn: $status
                ,label: {
                    /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
                })
            }
        }
    }
}

struct OpeningScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpeningScreenView()
    }
}
