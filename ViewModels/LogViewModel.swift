//
//  LogViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/26/21.
//

import Foundation
import CoreData

class LogViewModel: ObservableObject{
    
    func loadLoggedEmotions() -> [LoggedEmotion]{
        let mainContext = CoreDataManager.shared.mainContext
        let fetchRequest: NSFetchRequest<LoggedEmotion> = LoggedEmotion.fetchRequest()
        var results: [LoggedEmotion] = []
        
        do {
            results = try mainContext.fetch(fetchRequest)
        }
        catch{
            debugPrint(error)
        }
        
        return results
    }

    
    
}
