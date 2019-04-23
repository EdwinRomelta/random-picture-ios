//
//  SessionDataRepository.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import domain
import RxSwift

class SessionDataRepository: SessionRepository {
    
    private let factory: SessionDataStoreFactory
    private let sessionMapper: SessionMapper
    
    init(factory: SessionDataStoreFactory,
         sessionMapper: SessionMapper) {
        self.factory = factory
        self.sessionMapper = sessionMapper
    }
    
    func getSession() -> Observable<Session> {
        return factory.retrieveCacheDataStore().getSession()
            .flatMap{
                self.factory.retrieveRemoteDataStore().store($0)
                    .andThen(Single.just($0))
                    .asObservable()}
            .map{self.sessionMapper.mapFromEntity($0)}
    }
    
    func register(_ registerParam: RegisterParam) -> Completable {
        return  factory.retrieveRemoteDataStore().doRegister(registerParam)
                    .flatMapCompletable {
                        self.factory.retrieveCacheDataStore().store($0)}
    }
    
    func login(_ loginParam: LoginParam) -> Completable {
        return factory.retrieveRemoteDataStore().doLogin(loginParam)
            .flatMapCompletable {
                self.factory.retrieveCacheDataStore().store($0)
        }
    }
    
    func logout() -> Completable {
        return  factory.retrieveCacheDataStore().clear()
                    .andThen(factory.retrieveRemoteDataStore().clear())
    }
    
    
}
