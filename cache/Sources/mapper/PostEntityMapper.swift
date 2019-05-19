//
//  PostEntityMapper.swift
//  cache
//
//  Created by ImNotPro on 12/05/19.
//

import data
import CoreData

public class PostEntityMapper: EntityMapper {

    typealias Cache = CachedPost
    typealias Data = PostEntity

    private let context: NSManagedObjectContext

    public init(context: NSManagedObjectContext) {
        self.context = context
    }

    func mapFromCached(_ type: CachedPost) -> PostEntity {
        return PostEntity(id: type.id,
                             imgPath: type.imgPath,
                             text: type.text,
                             timeStamp: type.timestamp)
    }

    func mapToCached(_ type: PostEntity) -> CachedPost {
        return CachedPost(context,
                          id: type.id,
                         imgPath: type.imgPath,
                         text: type.text,
                         timestamp: type.timeStamp)
    }

}
