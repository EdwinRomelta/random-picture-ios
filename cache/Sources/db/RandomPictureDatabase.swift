//
//  RandomPictureDatabase.swift
//  cache
//
//  Created by ImNotPro on 19/05/19.
//

import Foundation
import CoreData

public class RandomPictureDatabase {

    public let context: NSManagedObjectContext
    private let storeCoordinator: NSPersistentStoreCoordinator

    public init() {
        let bundle = Bundle(for: RandomPictureDatabase.self)
        guard let url = bundle.url(forResource: "RandomPicture", withExtension: "momd"),
            let model = NSManagedObjectModel(contentsOf: url) else {
                fatalError()
        }
        self.storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        self.context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        self.context.persistentStoreCoordinator = self.storeCoordinator
        self.migrateStore()
    }

    private func migrateStore() {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            fatalError()
        }
        let storeUrl = url.appendingPathComponent("RandomPicture.sqlite")
        do {
            try storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                    configurationName: nil,
                                                    at: storeUrl,
                                                    options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
    }
}
