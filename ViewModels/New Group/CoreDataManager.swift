//
//  CoreDataManager.swift
//  SimpleMindfulness
//
//  Created by Tristan Nibbe on 4/26/21.
//

import Foundation
import CoreData

class CoreDataManager{
    static let shared = CoreDataManager()
    
    private init(){
        
    }
    
    private lazy var persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SimpleMindfulness")
        container.loadPersistentStores(completionHandler: { _, error in
            _ = error.map {fatalError("Unresolved error \($0)")}
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext{
        return persistantContainer.viewContext
    }
    
    func backgroundContext() -> NSManagedObjectContext{
        return persistantContainer.newBackgroundContext()
    }
    
}
