//
//  OpeningScreenViewModel.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/12/21.
//

import Foundation

class OpeningScreenViewModel: ObservableObject{
    func getPrivacyPolicy() -> [String]{
        var fileContent = ""
        if let filepath = Bundle.main.path(forResource: "PrivacyPolicy", ofType: "txt"){
            do{
                fileContent = try String(contentsOfFile: filepath)
            }catch{
                fileContent = "content could not be loaded"
            }
        }else{
            fileContent = "PrivacyPolicy.txt not found"
        }
        
        return fileContent.components(separatedBy: "----")
    }
}
