//
//  SessionCacheDataStore.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import domain
import RxSwift

public class SessionCacheDataStore: SessionDataStore {

    private let sessionCache: SessionCache

    public init(sessionCache: SessionCache) {
        self.sessionCache = sessionCache
    }

    func getSession() -> Observable<SessionEntity> {
        return sessionCache.get()
    }

    func store(_ sessionEntity: SessionEntity) -> Completable {
        return sessionCache.store(sessionEntity)
    }

    func doRegister(_ registerParam: RegisterParam) -> Single<SessionEntity> {
        fatalError("Unsupported Operation Exception")
    }

    func doLogin(_ loginParam: LoginParam) -> Single<SessionEntity> {
        fatalError("Unsupported Operation Exception")
    }

    func clear() -> Completable {
        return sessionCache.clear()
    }

}
