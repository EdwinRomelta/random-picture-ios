//
//  PostDataStoreFactory.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

public class PostDataStoreFactory {

    private let postCacheDataStore: PostCacheDataStore
    private let postRemoteDataStore: PostRemoteDataStore

    public init(postCacheDataStore: PostCacheDataStore,
                postRemoteDataStore: PostRemoteDataStore) {
        self.postCacheDataStore = postCacheDataStore
        self.postRemoteDataStore = postRemoteDataStore
    }

    func retrieveCacheDataStore() -> PostCacheDataStore {
        return postCacheDataStore
    }

    func retrieveRemoteDataStore() -> PostRemoteDataStore {
        return postRemoteDataStore
    }
}
