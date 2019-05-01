//
//  SessionCacheImpl.swift
//  cache
//
//  Created by ImNotPro on 27/04/19.
//

import data
import RxSwift

public class SessionCacheImpl: SessionCache {
    
    private let sessionPreference : SessionPreference
    private let sessionEntityMapper : SessionEntityMapper
    
    public init(sessionPreference : SessionPreference,
         sessionEntityMapper : SessionEntityMapper) {
        self.sessionPreference = sessionPreference
        self.sessionEntityMapper = sessionEntityMapper
    }
    
    public func store(_ sessionEntity: SessionEntity) -> Completable {
        return sessionPreference.store(sessionEntityMapper.mapToCached(sessionEntity))
    }
    
    public func get() -> Observable<SessionEntity> {
        return sessionPreference.get()
            .map{self.sessionEntityMapper.mapFromCached($0)}
    }
    
    public func clear() -> Completable {
        return sessionPreference.clear()
    }
    
}
