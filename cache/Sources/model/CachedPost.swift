//
//  CachedPost.swift
//  cache
//
//  Created by ImNotPro on 12/05/19.
//

import Foundation
import CoreData
import RxCoreData

public class CachedPost: NSManagedObject {

    public convenience init(_ context: NSManagedObjectContext,
                            id: String?,
                            imgPath: String?,
                            text: String?,
                            timestamp: Date?) {
        self.init(entity: NSEntityDescription.entity(forEntityName: "Post", in: context)!, insertInto: context)
        self.id = id
        self.imgPath = imgPath
        self.text = text
        self.timestamp = timestamp
    }
}

extension CachedPost: CachedCoreData {

    public static var entityName: String {
        return "Post"
    }

    public func update(_ entity: CachedPost) {
        self.id = entity.id
        self.imgPath = entity.imgPath
        self.text = entity.text
        self.timestamp = entity.timestamp
    }
}
