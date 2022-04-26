//
//  CoreDataStack.swift
//  Journal
//
//  Created by Thiago Costa on 4/25/22.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error),\(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
