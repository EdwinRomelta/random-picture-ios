//
//  PostCacheDataStore.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

import domain
import RxSwift

public class PostCacheDataStore: PostDataStore {

    private let postCache: PostCache

    public init(postCache: PostCache) {
        self.postCache = postCache
    }

    func getPosts() -> Observable<[PostEntity]> {
        return postCache.getPosts()
    }

    func savePosts(_ posts: [PostEntity]) -> Completable {
        return postCache.savePosts(posts)
    }

}
