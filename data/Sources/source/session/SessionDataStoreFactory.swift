//
//  SessionDataStoreFactory.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import Foundation

public class SessionDataStoreFactory {

    private let sessionCacheDataStore: SessionCacheDataStore
    private let sessionRemoteDataStore: SessionRemoteDataStore

    public init(sessionCacheDataStore: SessionCacheDataStore,
         sessionRemoteDataStore: SessionRemoteDataStore) {
        self.sessionCacheDataStore = sessionCacheDataStore
        self.sessionRemoteDataStore = sessionRemoteDataStore
    }

    func retrieveCacheDataStore() -> SessionCacheDataStore {
        return sessionCacheDataStore
    }

    func retrieveRemoteDataStore() -> SessionRemoteDataStore {
        return sessionRemoteDataStore
    }
}
