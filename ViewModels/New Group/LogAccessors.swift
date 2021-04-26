//
//  LogAccessors.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/26/21.
//

import Foundation
import CoreData

class LogAccessors{
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
    
    func logEmotion(emotion: emotionType) throws {
        let context = CoreDataManager.shared.backgroundContext()
        context.perform {
            let entity = LoggedEmotion.entity()
            let loggedEmotion = LoggedEmotion(entity: entity, insertInto: context)
            loggedEmotion.emotionType = Int16(emotion.rawValue)
            try! context.save()
        }
    }
    
}
