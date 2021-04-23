//
//  SimpleMindfulnessApp.swift
//  Shared
//
//  Created by Tristan Nibbe on 3/31/21.
//

import SwiftUI

@main
struct SimpleMindfulnessApp: App {
    @StateObject var motherViewModel = MotherViewModel()
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(motherViewModel)
        }
        
    }    
}
