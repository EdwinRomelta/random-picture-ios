//
//  SessionDataRepository.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import Cleanse
import RxSwift
import domain

public class SessionDataRepository: SessionRepository {

    private let factory: SessionDataStoreFactory
    private let sessionMapper: SessionMapper

    public init(factory: SessionDataStoreFactory,
         sessionMapper: SessionMapper) {
        self.factory = factory
        self.sessionMapper = sessionMapper
    }

    public func getSession() -> Observable<Session> {
        return factory.retrieveCacheDataStore().getSession()
            .flatMap {
                self.factory.retrieveRemoteDataStore().store($0)
                    .andThen(Single.just($0))
                    .asObservable()}
            .map {self.sessionMapper.mapFromEntity($0)}
    }

    public func register(_ registerParam: RegisterParam) -> Completable {
        return  factory.retrieveRemoteDataStore().doRegister(registerParam)
                    .flatMapCompletable {
                        self.factory.retrieveCacheDataStore().store($0)}
    }

    public func login(_ loginParam: LoginParam) -> Completable {
        return factory.retrieveRemoteDataStore().doLogin(loginParam)
            .flatMapCompletable {
                self.factory.retrieveCacheDataStore().store($0)
        }
    }

    public func logout() -> Completable {
        return  factory.retrieveCacheDataStore().clear()
                    .andThen(factory.retrieveRemoteDataStore().clear())
    }

}
