//
//  CachedCoreData.swift
//  cache
//
//  Created by ImNotPro on 18/05/19.
//

import Foundation
import CoreData

public protocol CachedCoreData: NSFetchRequestResult {

    static var entityName: String {get}

    func update(_ entity: Self)

}

extension CachedCoreData {

    public static func fetchRequest() -> NSFetchRequest<Self> {
        return NSFetchRequest<Self>(entityName: entityName)
    }
}
