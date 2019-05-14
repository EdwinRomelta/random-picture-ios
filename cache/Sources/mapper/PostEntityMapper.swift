//
//  PostEntityMapper.swift
//  cache
//
//  Created by ImNotPro on 12/05/19.
//

import data

public class PostEntityMapper: EntityMapper {
    
    typealias Cache = CachedPost
    typealias Data = PostEntity
    
    public init() {
        
    }
    
    func mapFromCached(_ type: CachedPost) -> PostEntity {
        return PostEntity(id: type.id,
                             imgPath: type.imgPath,
                             text: type.text,
                             timeStamp: type.timeStamp)
    }
    
    func mapToCached(_ type: PostEntity) -> CachedPost {
        return CachedPost(id: type.id,
                             imgPath: type.imgPath,
                             text: type.text,
                             timeStamp: type.timeStamp)
    }
    
}
