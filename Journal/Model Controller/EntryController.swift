//
//  EntryController.swift
//  Journal
//
//  Created by Cameron Stuart on 12/30/20.
//

import Foundation
import CoreData

class EntryController {
    
    static let shared = EntryController()
    var entries: [Entry] {
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        do {
            return try CoreDataStack.context.fetch(request)
        } catch {
            print("error fetching entries: \(error)")
            return []
        }
        
    }
    
    func add(entry: Entry) {
        saveToPersistentStorage()
    }
    
    func deleteEntry(entry: Entry) {
        if let moc = entry.managedObjectContext {
            moc.delete(entry)
        }
    }
    
    func update(entry: Entry, with title: String, text: String) {
        entry.title = title
        entry.text = text
        saveToPersistentStorage()
    }
        
    func saveToPersistentStorage() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("======== ERROR ========")
            print("Function: \(#function)")
            print("Error: \(error)")
            print("Description: \(error.localizedDescription)")
            print("======== ERROR ========")
        }
    }
}
