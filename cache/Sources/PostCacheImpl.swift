//
//  PostCacheImpl.swift
//  cache
//
//  Created by ImNotPro on 12/05/19.
//

import data
import RxSwift

public class PostCacheImpl: PostCache {

    let cachedPostDao: CachePostDao
    let postEntityMapper: PostEntityMapper

    public init(cachedPostDao: CachePostDao,
                postEntityMapper: PostEntityMapper) {
        self.cachedPostDao = cachedPostDao
        self.postEntityMapper = postEntityMapper
    }

    public func getPosts() -> Observable<[PostEntity]> {
        return cachedPostDao.all()
            .map {$0.map {self.postEntityMapper.mapFromCached($0)}}
    }

    public func savePosts(_ posts: [PostEntity]) -> Completable {
        return cachedPostDao.save(postEntityMapper.mapToCached(posts[0]))
    }
}
