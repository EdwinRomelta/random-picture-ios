//
//  SessionCacheImpl.swift
//  cache
//
//  Created by ImNotPro on 27/04/19.
//

import data
import RxSwift

class SessionCacheImpl: SessionCache {
    
    private let sessionPreference : SessionPreference
    private let sessionEntityMapper : SessionEntityMapper
    
    init(sessionPreference : SessionPreference,
         sessionEntityMapper : SessionEntityMapper) {
        self.sessionPreference = sessionPreference
        self.sessionEntityMapper = sessionEntityMapper
    }
    
    func store(_ sessionEntity: SessionEntity) -> Completable {
        return sessionPreference.store(sessionEntityMapper.mapToCached(sessionEntity))
    }
    
    func get() -> Observable<SessionEntity> {
        return sessionPreference.get()
            .map{self.sessionEntityMapper.mapFromCached($0)}
    }
    
    func clear() -> Completable {
        return sessionPreference.clear()
    }
    
}
