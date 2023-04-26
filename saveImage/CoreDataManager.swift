//
//  CoreDataManager.swift
//  saveImage
//
//  Created by Mohan K on 16/03/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared : CoreDataManager = CoreDataManager ()
    private init() {
        persistentContainer = NSPersistentContainer(name: "Photo")
        persistentContainer.loadPersistentStores { description, error In
            if let error = error {
                fatalError("unable to initialize Core Data \(error)")
            }
        }
    }
}
