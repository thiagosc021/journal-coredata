//
//  Entry+Convinience.swift
//  Journal
//
//  Created by Thiago Costa on 4/25/22.
//

import Foundation
import CoreData

extension Entry {
    convenience init(title: String, text: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
}
