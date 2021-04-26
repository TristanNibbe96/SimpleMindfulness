//
//  EmotionButtonViewModel.swift
//  SimpleMindfulness (iOS)
//
//  Created by Tristan Nibbe on 4/10/21.
//

import Foundation

class EmotionButtonViewModel: ObservableObject{
    func buttonText(emotion: emotionType) -> String{
        var emotionText = ""
        
        switch emotion {
        case emotionType.angry:
            emotionText = "Angry"
        case emotionType.bleh:
            emotionText = "Bleh"
        case emotionType.happy:
            emotionText = "Happy"
        case emotionType.sad:
            emotionText = "Sad"
        }
        return emotionText
        
    }
    
    func imageText(emotion: emotionType) -> String{
        var imageText = ""
        
        switch emotion {
        case emotionType.angry:
            imageText = "Face_Angry"
        case emotionType.bleh:
            imageText = "Face_Bleh"
        case emotionType.happy:
            imageText = "Face_Happy"
        case emotionType.sad:
            imageText = "Face_Sad"
        }
        
        return imageText
    }
    
    func logEmotion(emotion: emotionType) {
        let context = CoreDataManager.shared.backgroundContext()
        context.perform {
            let entity = LoggedEmotion.entity()
            let loggedEmotion = LoggedEmotion(entity: entity, insertInto: context)
            loggedEmotion.emotionType = Int16(emotion.rawValue)
            do{
                try context.save()
            } catch{
                print(error)
            }
        }
    }
}
